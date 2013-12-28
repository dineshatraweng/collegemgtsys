class CreateSubjectTeacher < ActiveRecord::Migration
  def self.up
  	 create_table :subjects_teachers,:id=>false do |t|
  	 	t.integer "subject_id"
  	 	t.integer "teacher_id"
  	 end	
  end

  def self.down
  	 drop_table :subjects_teachers
  end
end
