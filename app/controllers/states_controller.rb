class StatesController < ApplicationController
  before_action :require_user
  
  def index
    @year = Year.find(params[:year_id])
    @student = @year.students.find(params[:student_id])
    @state = @student.state    
  end
end