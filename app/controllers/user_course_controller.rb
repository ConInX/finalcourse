class UserCourseController < ApplicationController
  
  #用来进行相应的课表的绘制
  #首先先查询当前用户的所有选课信息，根据所有的选课的选课时间，在相应的课表的位置填写相关的课程信息
  def user_course
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
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
  
  #在我的课表中的课程后单击删除操作，则删除自己课表中的课程
  def delete
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    cname=params[:cname]
    username=session[:name]
    @course=Usercourse.find_by_name_and_coursename(username,cname)
    @course.destroy
    information="课程删除成功"
    redirect_to :controller => 'user_course', :action => 'user_course',:information=>information
  end
  
  
  #为自己的课表添加新的课程
  #如果课程在自己的课表中，则提示 该课程已经在你的课表中 的信息
  #如果选择的课程和你的课表中的课程出现了时间冲突，则添加课程失败，给出相应提示
  #添加课程成功也要给出相应的提示
  def add
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
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
  
  
  
  #显示一个课程的包括上课地点、时间、任课老师等详细的信息
  def details
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    cname=params[:cname]
    @course=Course.find_by_coursename(cname)
  end
  
  #为自己的课表天假课程，包括上课时间冲突的验证
  def new 
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
    @courses=Course.all
    @information = params[:information]
    universities=University.all
    
    @universitiesname=Array.new
    universities.each do |university|
      @universitiesname.unshift(university.universityname)
    end
    @universitiesname.unshift("请选择您的学校")
    
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
  
   #为选课列表添加一个新的候选选项
  #需要填写课程的名称、课程时间、上课地点、所属学校、任课老师等信息，在数据库courses表中进行存储
  def addbyself
    username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
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
      username=session[:name]
    articles=Article.where(:name => username)
    comments=Comment.where(:name => username)
    @size1=articles.size
    @size2=comments.size
      cname=params[:cname]
      @course=Course.find_by_coursename(cname)
    end

end
