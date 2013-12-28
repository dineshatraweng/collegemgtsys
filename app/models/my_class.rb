class MyClass < ActiveRecord::Base

	has_many :students, :dependent=> :destroy, :uniq => true
    has_many :my_class_teachers
	has_many :teachers, :through=>:my_class_teachers
	has_and_belongs_to_many :subjects , :uniq => true

   # validate :has_my_class_subject

  	# def has_my_class_subject
   #  	self.teachers.each do |t|
   #  		binding.pry
 	 #    	self.errors.add(:base, "teacher is not validate in this class") unless self.subjects.map(&:name).include?(t.subject.name)
 	 #    end	
 	    
  	# end


  	# def student_name
   #      students.name if students
   #  end

   #  def student_name=(name)
   #      self.students = Student.find_or_create_by_name(name) unless name.blank?
   #  end

end
