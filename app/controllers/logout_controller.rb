class LogoutController < ApplicationController
    #登出功能
    #将登陆成功时，放置在session中的所有用户信息清空
    def logout
        @size1=0
        @size2=0
        if(session[:name]==nil)
            redirect_to :controller=>'login',:action=>'login',:hint=>"请先登陆"
            return
        end
        session[:name]=nil
        redirect_to :controller =>'login', :action =>'login'
    end
end
