class CreateUniversities < ActiveRecord::Migration
  
  
  def self.up
    create_table :universities do |t|
      #大学的名称
      t.column :universityname, :string
      #大学的位置
      t.column :location, :string
      t.timestamps
    end
  end
 
  def self.down
    drop_table :universities
  end


end
