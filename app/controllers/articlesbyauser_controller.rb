class ArticlesbyauserController < ApplicationController
  #在数据库中的articles表中根据用户名查找一个用户发表过的所有文章
  def articlesbyauser
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    if(session[:name]==nil)
      redirect_to :controller=>'login',:action=>'login',:hint=>"请先登陆"
      return
    end
    username=session[:name]
    @articles=Article.where(:name => username)
  end
  
  #根据用户提交的需要删除的文章的id，在数据库中找到指定id的文章，并在数据库中删除相关记录
  def delete
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    id=params[:id]
    @oldarticle=Article.find_by_id(id)
    @oldarticle.destroy
    redirect_to :controller =>'articlesbyauser' ,  :action => 'articlesbyauser'
  end
end
