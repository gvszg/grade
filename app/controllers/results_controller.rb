class ResultsController < ApplicationController
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
      redirect_to year_student_states_path(@year, @student, @state)
    else
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(:subject, :score)
  end
end