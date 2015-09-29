class StudentsController < ApplicationController
  def index
    @year = Year.find(params[:year_id])
    @students = @year.students.all.order('number ASC')
  end

  def new
    @year = Year.find(params[:year_id])
    @student = @year.students.new
    @state = @student.state
  end

  def create
    @year = Year.find(params[:year_id])
    @student = @year.students.new(student_params)

    if @student.save
      State.create(student_id: @student.id)
      redirect_to year_students_path(@year)
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:number, :name)
  end
end