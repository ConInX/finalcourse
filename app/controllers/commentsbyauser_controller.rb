class CommentsbyauserController < ApplicationController
  #在数据库的comments表中根据用户名查找所有的纪录，并展示给页面一个用户所有的评论信息
  def commentsbyauser
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    if(session[:name]==nil)
      redirect_to :controller=>'login',:action=>'login',:hint=>"请先登陆"
      return
    end
    @hint=params[:hint]
    username=session[:name]
    @comments=Comment.where(:name => username)
  end
  
  #根据view层传来的评论的id信息，在数据库中找到对应的纪录并删除
  #如果对应的文章已经被删除，则给view层提示“改文章已被删除”的提示信息
  def delete
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    articlename=params[:aname]
    #username=session[:name]
    coursename=params[:cname]
    commentid=params[:commentid]
    
    
    
    @oldcomment=Comment.find_by_id(commentid)
    @oldcomment.destroy
   
   @article=Article.find_by_articlename(articlename)
    if(@article==nil)
      hint="该文章已经被删除"
      redirect_to :controller=>'commentsbyauser' , :action=>'commentsbyauser',:hint=>hint
      return
    end
   
    @article=Article.find_by_articlename(articlename)
    comments=Comment.where(:coursename =>coursename,:articlename=>articlename)
      answertimes=comments.size
      @article.update_attribute(:answertimes,answertimes)
    
    redirect_to :controller =>'commentsbyauser' ,  :action => 'commentsbyauser'
  end
  
end
