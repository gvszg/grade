class YearsController < ApplicationController
  def index
    @years = Year.all.order('number ASC')
  end

  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)

    if @year.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def year_params
    params.require(:year).permit(:number)
  end
end