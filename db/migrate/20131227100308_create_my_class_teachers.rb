class CreateMyClassTeachers < ActiveRecord::Migration
  def self.up
    create_table :my_class_teachers do |t|
      t.integer :my_class_id
      t.integer :teacher_id
      t.string :subjectname

      t.timestamps
    end
  end

  def self.down
    drop_table :my_class_teachers
  end
end
