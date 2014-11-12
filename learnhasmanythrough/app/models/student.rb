class Student < ActiveRecord::Base
	has_many :course, through: :enrollments
	has_many :enrollments
end
