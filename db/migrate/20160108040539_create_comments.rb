class CreateComments < ActiveRecord::Migration
   def self.up
    create_table :comments do |t|
      #评论的内容
      t.column :content, :text
      #评论对应的文章
      t.column :articlename, :string
      #发表评论的用户
      t.column :name , :string
      #评论所对应的课程
      t.column :coursename,:string
      #评论的发表时间
      t.column :createtime ,:date
      t.timestamps
    end
  end
  
  def self.down
    drop_table :comments
  end
  
end
