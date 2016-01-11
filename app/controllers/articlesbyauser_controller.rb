class ArticlesbyauserController < ApplicationController
  def articlesbyauser
    if(session[:name]==nil)
      redirect_to :controller=>'login',:action=>'login',:hint=>"请先登陆"
      return
    end
    username=session[:name]
    @articles=Article.where(:name => username)
  end
  
  def delete
    articlename=params[:aname]
    @oldarticle=Article.find_by_articlename(articlename)
    @oldarticle.destroy
    redirect_to :controller =>'articlesbyauser' ,  :action => 'articlesbyauser'
  end
end
