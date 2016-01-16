class CommentsbyauserController < ApplicationController
  def commentsbyauser
    @hint=params[:hint]
    username=session[:name]
    @comments=Comment.where(:name => username)
  end
  
  def delete
    articlename=params[:aname]
    #username=session[:name]
    coursename=params[:cname]
    commentid=params[:commentid]
    
    @oldcomment=Comment.find_by_id(commentid)
    @oldcomment.destroy
   
    @article=Article.find_by_articlename(articlename)
    comments=Comment.where(:coursename =>coursename,:articlename=>articlename)
      answertimes=comments.size
      @article.update_attribute(:answertimes,answertimes)
    
    redirect_to :controller =>'commentsbyauser' ,  :action => 'commentsbyauser'
  end
  
end
