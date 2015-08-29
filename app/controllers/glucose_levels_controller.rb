class GlucoseLevelsController < ApplicationController
  def index
    @glucose_levels = current_user.get_levels rescue []
  end
  
  def new
    @glucose_level = GlucoseLevel.new
  end
 
  def create
    @glucose_level = current_user.glucose_levels.new(glucose_level_params.merge!(:registered_date => Date.today))
 
    if @glucose_level.save
      redirect_to glucose_levels_path
    else
      flash.now[:error] = "Sorry, #{@glucose_level.errors[:base].join(', ')}" if @glucose_level.errors[:base].present?
      render 'new'
    end
  end
 
  private
    def glucose_level_params
      params.require(:glucose_level).permit(:level)
    end
end
