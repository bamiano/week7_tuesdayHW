class Course < ActiveRecord::Base
	has_many :students, through: :enrollments
	has_many :enrollments
end
