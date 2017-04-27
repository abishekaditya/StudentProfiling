class AddFieldsToCourseStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :course_students, :student, foreign_key: true
    add_reference :course_students, :course, foreign_key: true
  end
end
