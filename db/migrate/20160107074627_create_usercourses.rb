class CreateUsercourses < ActiveRecord::Migration
 def self.up
   #用户的课程的关联表 用用户的name属性和课程的coursename属性进行关联
    create_table :usercourses do |t|
      t.column :name, :string
      t.column :coursename, :string
      t.timestamps
    end
  end
 
  def self.down
    drop_table :usercourse
  end
end
