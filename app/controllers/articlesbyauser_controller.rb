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
    id=params[:id]
    @oldarticle=Article.find_by_id(id)
    @oldarticle.destroy
    redirect_to :controller =>'articlesbyauser' ,  :action => 'articlesbyauser'
  end
end
