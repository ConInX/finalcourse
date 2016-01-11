class CreateUseruniversities < ActiveRecord::Migration
  def self.up
    #用户和大学的关联表  用用户的name属性和大学的universityname属性进行关联
    create_table :useruniversities do |t|
      t.column :name, :string
      t.column :universityname, :string
      t.timestamps
    end
  end
 
  def self.down
    drop_table :useruniversities
  end
end
