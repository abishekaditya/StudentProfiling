class Question < ApplicationRecord
  has_many :responses

  def students id
    @cs = CourseStudent.joins(:student).where(:course_id => id)
    Student.where(:id => @cs )
  end

end
