class CourseController < ApplicationController
  def index
    @cors = CourseStudent.where(student_id: current_student.id).select(:course_id)
  end

  def analysis
    @cors = Course.where(teacher_id: current_teacher.id)
  end

  def join
    if current_teacher != nil
      redirect_to home_teacher_path
    end
  end

  def create
    if current_student != nil
      redirect_to home_student_path
    end
  end

  def make
    Course.create(teacher_id: current_teacher.id, code: params[:code])
    redirect_to home_teacher_path
  end

  def new
    @course_id = params[:id]
    if Course.where(teacher_id: current_teacher.id).find(@course_id) != nil
      courses = CourseStudent.where(:course_id => @course_id)
      @students = []
      courses.each do |s|
        @students << Student.find(s.student_id)
      end
    end
  end

  def verify
    if Course.find_by_code(params[:code]) != nil
        CourseStudent.create(student_id: current_student.id, course_id: Course.find_by_code(params[:code]).id)
    end
    redirect_to home_student_path
  end

  def destroy
  end
end
