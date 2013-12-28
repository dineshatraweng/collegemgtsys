class Subject < ActiveRecord::Base
	#belongs_to :teacher
	has_and_belongs_to_many :teachers, :uniq => true
	has_and_belongs_to_many :my_classes, :uniq => true
end
