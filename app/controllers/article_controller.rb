class ArticleController < ApplicationController
  #该函数用来战士页面article/article  主要查找了一个课程下的所有文章，用于页面的战士
  def article
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    @hint=params[:hint]
    @coursename=params[:cname]
    session[:coursename]=@coursename
    @articles=Article.where(:coursename =>@coursename)
  end
  
  #根据用户在表单中填写的文章的名称和文章的内容，在数据库中保存，并且重定向到article/article页面
  def newarticle
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    unless request.get?
      commit = params[:commit]
      username=session[:name]
      @coursename=session[:coursename]
      
      if(commit=="返回")
        redirect_to :controller =>'article' ,  :action => 'article' ,:cname=>@coursename
        return
      end
      articlename=params[:article][:articlename]
      content=params[:article][:content]
      createtime=Time.new
      viewtimes=0
      answertimes=0
      @newarticle= Article.create!( :articlename => articlename, :content => content,
                                    :coursename => @coursename , :name =>username,
                                    :createtime => createtime, :viewtimes =>viewtimes, :answertimes => answertimes)
      @hint="添加文章成功"
      redirect_to :controller =>'article' ,  :action => 'article',:cname => @coursename,:hint =>@hint
    end
  end
  
  #用来展示一篇文章的名称、内容、创建时间、评论等信息
  def details
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    articlename=params[:aname]
    coursename=params[:cname]
    session[:articlename]=articlename
    session[:coursename]=coursename
    #@hint=params[:hint]
    
    @article=Article.find_by_articlename(articlename)
    if(@article==nil)
      hint="该文章已经被删除"
      redirect_to :controller=>'commentsbyauser' , :action=>'commentsbyauser',:hint=>hint
      return
    end
    
    @article=Article.find_by_articlename(articlename)
    viewtimes=@article.viewtimes+1
    @article.update_attribute(:viewtimes,viewtimes)
    
    @comments=Comment.where(:articlename=>articlename,:coursename=>coursename)
  end
  
  #根据表单提交的用户评论的内容，对一篇文章进行评论，并讲该评论在数据库中保存
  def newcomment
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
      @articlename=session[:articlename]
       @coursename=session[:coursename]
    unless request.get?

      commit=params[:commit]
      if(commit=="返回文章")
       redirect_to :controller =>'article' ,:action => 'details',:aname=>@articlename,:cname=>@coursename
        return
      end
      
      content=params[:comment][:content]
      name=session[:name]
      createtime=Time.new
      @newcomment=Comment.create!(:content=>content,:articlename=>@articlename,:name=>name,:coursename=>@coursename,:createtime=>createtime)
      @hint="评论成功"
      @article=Article.find_by_articlename(@articlename)
      comments=Comment.where(:coursename =>@coursename,:articlename=>@articlename)
      answertimes=comments.size
      @article.update_attribute(:answertimes,answertimes)
      redirect_to :controller =>'article',:action => 'details',:aname=>@articlename,:cname=>@coursename
    end
    
  end
  
  
end
