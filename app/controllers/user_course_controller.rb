class UserCourseController < ApplicationController
  
  def user_course
    @information=params[:information]
    if(session[:name]==nil)
      redirect_to :controller=>'login',:action=>'login',:hint=>"请先登陆"
      return
    end
    
    @day1={"第1节"=>"","第2节"=>"","第3节"=>"","第4节"=>"","第5节"=>"","第6节"=>"","第7节"=>"","第8节"=>"","第9节"=>""}
    @day2={"第1节"=>"","第2节"=>"","第3节"=>"","第4节"=>"","第5节"=>"","第6节"=>"","第7节"=>"","第8节"=>"","第9节"=>""}
    @day3={"第1节"=>"","第2节"=>"","第3节"=>"","第4节"=>"","第5节"=>"","第6节"=>"","第7节"=>"","第8节"=>"","第9节"=>""}
    @day4={"第1节"=>"","第2节"=>"","第3节"=>"","第4节"=>"","第5节"=>"","第6节"=>"","第7节"=>"","第8节"=>"","第9节"=>""}
    @day5={"第1节"=>"","第2节"=>"","第3节"=>"","第4节"=>"","第5节"=>"","第6节"=>"","第7节"=>"","第8节"=>"","第9节"=>""}
    @day6={"第1节"=>"","第2节"=>"","第3节"=>"","第4节"=>"","第5节"=>"","第6节"=>"","第7节"=>"","第8节"=>"","第9节"=>""}
    
    username=session[:name]
    user_courses = Usercourse.where(:name =>username)
    courses=Array.new
    user_courses.each do |user_course|
      coursename=user_course.coursename
      courses.unshift(Course.find_by_coursename(coursename))
    end
    
    if(courses.class!=NilClass)
      courses.each do |user_course|
        time=user_course.classtime.split
        if( time[0]=="周一")
          @day1[ time[1] ]=user_course.coursename
        elsif(time[0]=="周二")
          @day2[ time[1] ]=user_course.coursename
        elsif(time[0]=="周三")
          @day3[ time[1] ]=user_course.coursename
        elsif(time[0]=="周四")
          @day4[ time[1] ]=user_course.coursename
        elsif(time[0]=="周五")
          @day5[ time[1] ]=user_course.coursename
        elsif(time[0]=="周六")
          @day6[ time[1] ]=user_course.coursename
        end
      end
    end
    
  end
  
  
  def delete
    cname=params[:cname]
    username=session[:name]
    @course=Usercourse.find_by_name_and_coursename(username,cname)
    @course.destroy
    information="课程删除成功"
    redirect_to :controller => 'user_course', :action => 'user_course',:information=>information
  end
  
  
  
  def add
    coursename=params[:cname]
    name=session[:name]
    courseInUserCourse=Usercourse.find_by_name_and_coursename(name,coursename)
    
    if(courseInUserCourse!=nil)
      @information="该课程已经在你的课表中"
      redirect_to :controller => 'user_course', :action => 'user_course' ,:information => @information
    else
      courseInCourse=Course.find_by_coursename(coursename)
      coursesInUserCourse=Usercourse.where(:name=>name)
      courses=Array.new
      coursesInUserCourse.each do |temp|
        c=Course.find_by_coursename(temp.coursename)
        courses.unshift(c)  
      end
      
      courses.each do |course1|
        if(courseInCourse.classtime==course1.classtime)
          @information="该时段已经有课程，添加失败"
          redirect_to :controller => 'user_course', :action => 'user_course', :information =>@information
          return
        end
      end
      
      Usercourse.create!(:name => name, :coursename =>coursename)
      @information="添加成功"
      redirect_to :controller => 'user_course', :action => 'user_course', :information =>@information
    end
  end
  
  
  
  
  def details
    cname=params[:cname]
    @course=Course.find_by_coursename(cname)
  end
  

  def new 
    @courses=Course.all
    @information = params[:information]
    universities=University.all
    
    @universitiesname=Array.new
    universities.each do |university|
      @universitiesname.unshift(university.universityname)
    end
    
    commit=params[:commit]
    if(commit=="刷新")
      university=params[:uniersity][:universityname]
      if(university=="请选择您的学校")
        return
      end
      @courses=Course.where(:university =>university)
      return
    end
    
  end
  
  
  def addbyself
      universities=University.all
    
      @universitiesname=Array.new
      universities.each do |university|
        @universitiesname.unshift(university.universityname)
      end
      
      @days=Array.new
      @days=["周一","周二","周三","周四","周五","周六"]
      
      @tiems=Array.new
      @times=["第1节","第2节","第3节","第4节","第5节","第6节","第7节","第8节","第9节"]
      
      unless request.get?
        coursename=params[:course][:coursename]
        day=params[:day][:day]
        time=params[:time][:time]
        classtime=day+" "+time
        classroom=params[:course][:classroom]
        tercher=params[:course][:tercher]
        university=params[:university][:universityname]
        if(coursename=="" || classroom=="" || tercher=="" ||university=="请选择您的学校")
          @hint="课程信息填写不能有空"
          return
        end
        Course.create!(:coursename=>coursename,:classtime=>classtime,:classroom=>classroom,:tercher=>tercher,:university=>university)
        @information="自定义课程添加成功"
        redirect_to :controller => 'user_course', :action => 'new', :information =>@information
      end
    end
    
    def details1
      cname=params[:cname]
      @course=Course.find_by_coursename(cname)
    end

end
