class HomeController < ApplicationController
  def index
    if current_student != nil
      redirect_to '/home/student'
    elsif current_teacher != nil
      redirect_to '/home/teacher'
    end
  end


  def student

  end

  def teacher

  end
end
