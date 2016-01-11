class CommentsbyauserController < ApplicationController
  def commentsbyauser
    if(session[:name]==nil)
      redirect_to :controller=>'login',:action=>'login',:hint=>"请先登陆"
      return
    end
    username=session[:name]
    @comments=Comment.where(:name => username)
  end
  
  def delete
    articlename=params[:aname]
    username=session[:name]
    @oldcomment=Comment.find_by_articlename_and_name(articlename,username)
    @oldcomment.destroy
    redirect_to :controller =>'commentsbyauser' ,  :action => 'commentsbyauser'
  end
  
end
