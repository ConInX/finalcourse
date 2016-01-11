class LogoutController < ApplicationController
    def logout
        if(session[:name]==nil)
            redirect_to :controller=>'login',:action=>'login',:hint=>"请先登陆"
            return
        end
        session[:name]=nil
        redirect_to :controller =>'login', :action =>'login'
    end
end
