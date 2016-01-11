class LoginController < ApplicationController
 def login
    @hint = params[:hint]
    unless request.get?
        username = params[:user][:name]
        password = params[:user][:password]
        @hint = "ok"
        @user = User.find_by_name(username)
        commit = params[:commit]
        
        if(commit=="注册")
          redirect_to :controller =>'login' ,  :action => 'index'
          return
        end
        
        if(username=="" || password=="")
          @hint="用户名、密码不能为空"
          return
        end
        
        if @user.class == NilClass
          @hint = '该用户未被注册!'
        elsif @user.password == params[:user][:password]
          if(session[:name]!=nil)
            redirect_to :controller => 'user_course', :action => 'user_course',:information=>session[:name].to_s+"已登陆，若重新登陆请先退出"
            return
          end
          session[:name]=username
          redirect_to :controller => 'user_course', :action => 'user_course'
        else
          @hint = "密码错误，请重新登陆"
        end        
    end
  end
 
  def index
    @gendars=Array.new
    @gendars.unshift("男")
    @gendars.unshift("女")
    
    universities=University.all
    
    @universitiesname=Array.new
    universities.each do |university|
      @universitiesname.unshift(university.universityname)
    end
    
    unless request.get?
      if(params[:commit] == "返回")
        redirect_to :controller =>'login' , :action => 'login'
        return
      end
      
      username = params[:user][:name]
      email=params[:university][:universityname]
      password=params[:user][:password]
      password1=params[:user][:password1]
      gendar=params[:gendar][:gendar]
      user = User.find_by_name(username)
      
      if(user!=nil)
        @hint="该用户已经被注册"
      else
        if(username==""||email==""||gendar==""||password=="")
          @hint="填写的信息不能为空"
          return
        end
        if(password.to_s!=password1.to_s)
          @hint="两次密码不一致"
          return
        end
         if(username.to_s.length<5)
          @hint="用户名最少为5位"
          return
        end
        if(password.to_s.length<5)
          @hint="密码最少为5位"
          return
        end
        if(email.to_s=="请选择您的学校")
          @hint="请选择学校"
          return
        end
        @newuser = User.create!(:name=>username,:email=>email,:password=>password,:gendar=>gendar)
        session[:name]=username
        redirect_to :controller => 'user_course', :action => 'user_course',:information=>"注册成功，已登陆"
      end

    end
  end
  
  def user_params  
    params.require(:user).permit(:name, :email, :password, :gendar)  
  end 
  
end
