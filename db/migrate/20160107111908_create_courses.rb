class CreateCourses < ActiveRecord::Migration
   def self.up
    create_table :courses do |t|
      #课程的名称
      t.column :coursename, :string

      #课程的上课时间
      t.column :classtime, :string
      
      #课程的上课地点
      t.column :classroom, :string
      
      #课程的任课老师
      t.column :tercher, :string
      
      #课程所属的大学
      t.column :university, :string
      t.timestamps
    end
  end
 
  def self.down
    drop_table :courses
  end
end
