class CreateArticles < ActiveRecord::Migration
   def self.up
    create_table :articles do |t|
      #文章的名称
      t.column :articlename, :string
      
      #文章的内容
      t.column :content, :text
      
      #文章对应的课程
      t.column :coursename, :string
      
      #发表文章的用户的姓名
      t.column :name, :string
      
      #发表文章的时间
      t.column :createtime,:date
      
      #文章被浏览的次数
      t.column :viewtimes ,:decimal
      
      #文章被回答的次数
      t.column :answertimes ,:decimal
      
      t.timestamps
    end
  end
 
  def self.down
    drop_table :articles
  end
end
