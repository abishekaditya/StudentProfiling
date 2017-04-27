class Course < ApplicationRecord
  has_many :tests
  has_many :students, :through => :course_students
end
