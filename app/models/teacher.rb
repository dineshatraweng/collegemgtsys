class Teacher < ActiveRecord::Base
	attr_accessible :name, :mob,:address,:created_at,:updated_at
	#has_one :subject
	has_many :my_class_teachers
	has_many :my_classes, :through=>:my_class_teachers
	has_and_belongs_to_many :subjects, :uniq => true
end
