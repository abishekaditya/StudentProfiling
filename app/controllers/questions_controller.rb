class QuestionsController < ApplicationController
  def add
    @courses = Course.where(teacher_id: current_teacher.id).collect { |c| c.code }
  end

  def analysis
    @cors = Course.where(teacher_id: current_teacher.id)
  end

  def submit
   @code = params['post']['code']
   @question = params[:question]
    @answer = params['post']['answer']
    Question.create(course_id: Course.find_by_code(@code).id,question: @question, a: params[:a], b: params[:b], c: params[:c], d: params[:d], answer: @answer)
    redirect_to(questions_add_path)
  end


  def attempt
    if current_student == nil
      redirect_to questions_index_path
    end

    q = Question.where(:course_id => params[:id])
    s = Question.new.students(params[:id])
    intelligence = s.reduce(0){ |a,i| a += i.intelligence}
    count = s.count != 0 ? s.count : 1
    @score = (2 * (intelligence/count) / 3) * Question.count
    @ques = []
    x = []
    marks = 0
    (1..5).each do |i|
    x[i] = q.find_by_toughness(i)
    end

    @questions = q.all.shuffle.take(5)
  end


  def submitted
    @marks = 0
    curr_int = Student.find(current_student).intelligence
    params['post'].each do |k,v|
      @curr_q = Question.where(:id => k)
      toughness = @curr_q.first.toughness
      if @curr_q.first.answer == v
        @curr_q.update(:toughness => toughness - curr_int * 0.1)
        @marks += 1
      else
        @curr_q.update(:toughness => toughness + curr_int * 0.1)
      end
    end
    @total = params['post'].count

    Student.find(current_student).update(:intelligence => curr_int + ((@marks/@total * 1.0 ) - 0.5).to_f )

  end

  def index
    id = params[:id]
    @questions = Question.where(course_id: id)
  end
end

