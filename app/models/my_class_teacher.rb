class MyClassTeacher < ActiveRecord::Base
	belongs_to :my_class
	belongs_to :teacher
	validates :subjectname, :presence => true
    attr_accessible :my_class_id, :teacher_id, :subjectname
end
