class Student < ActiveRecord::Base
	belongs_to :my_class
	has_many :subjects ,:through=>:my_class, :uniq => true
end
