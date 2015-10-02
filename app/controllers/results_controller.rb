class ResultsController < ApplicationController
  before_action :require_user

  def new
    @year = Year.find(params[:year_id])
    @student = @year.students.find(params[:student_id])
    @state = @student.state
    @result = @state.results.new  
  end

  def create
    @year = Year.find(params[:year_id])
    @student = @year.students.find(params[:student_id])
    @state = @student.state
    @result = @state.results.new(result_params)

    if @result.save
      flash[:notice] = "The result was cereated!"
      redirect_to year_student_states_path(@year, @student, @state)
    else
      render :new
    end
  end

  def edit
    @year = Year.find(params[:year_id])
    @student = @year.students.find(params[:student_id])
    @state = @student.state
    @result = @state.results.find(params[:id])
  end

  def update
    @year = Year.find(params[:year_id])
    @student = @year.students.find(params[:student_id])
    @state = @student.state
    @result = @state.results.find(params[:id])

    if @result.update(result_params)
      flash[:notice] = "The result was updated!"
      redirect_to year_student_states_path(@year, @student, @state)
    else
      render :edit
    end
  end

  private

  def result_params
    params.require(:result).permit(:subject, :score)
  end
end