class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.integer :mob
      t.string :address
      t.integer :my_class_id

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
