class CreateUsers < ActiveRecord::Migration
  def self.up
    #用户表，在注册的时候会添加到该表中
    create_table :users do |t|
      #用户名
      t.column :name, :string
      #用户的邮箱
      t.column :email, :string
      #用户的密码
      t.column :password, :string
      #用户的性别
      t.column :gendar, :string
      
      t.timestamps
    end
  end
 
  def self.down
    drop_table :users
  end
end
