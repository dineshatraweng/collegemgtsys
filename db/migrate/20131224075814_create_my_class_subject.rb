
class CreateMyClassSubject < ActiveRecord::Migration
  def self.up
  	create_table :my_classes_subjects ,:id=> false do |t|
  		t.integer :my_class_id
  		t.integer :subject_id
  	end	
  end

  def self.down
  	drop_table :my_classes_subjects
  end
end
