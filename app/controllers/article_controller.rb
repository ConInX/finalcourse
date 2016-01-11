class ArticleController < ApplicationController
  
  def article
    @hint=params[:hint]
    @coursename=params[:cname]
    session[:coursename]=@coursename
    @articles=Article.where(:coursename =>@coursename)
  end
  
  
  def newarticle
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
  
  
  def details
    articlename=params[:aname]
    coursename=params[:cname]
    session[:articlename]=articlename
    session[:coursename]=coursename
    @hint=params[:hint]
    
    @article=Article.find_by_articlename(articlename)
    viewtimes=@article.viewtimes+1
    @article.update_attribute(:viewtimes,viewtimes)
    
    @comments=Comment.where(:coursename => coursename,:articlename=>articlename)
  end
  
  def newcomment
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
      answertimes=@article.answertimes+1
      @article.update_attribute(:answertimes,answertimes)
      redirect_to :controller =>'article',:action => 'details',:aname=>@articlename,:cname=>@coursename
    end
    
  end
  
  
end
