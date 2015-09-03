class ReportsController < ApplicationController
  
  # Reports type :
  # Daily
  # Month to Date
  # Monthly
  
  def index
    @date = Date.today
  end
  
  def fetch
    @date = params[:date]
    @type = params[:type]
    case @type
    when 'daily'
      @min, @max, @avg = GlucoseLevel.get_report_data(@date, @date, current_user.id)
    when 'month_to_date'
      @min, @max, @avg = GlucoseLevel.get_report_data(Date.parse(@date).at_beginning_of_month.to_s, Date.parse(@date).to_s, current_user.id)
    when 'monthly'
      @min, @max, @avg = GlucoseLevel.get_report_data(Date.parse(@date).prev_month.to_s, Date.parse(@date).to_s, current_user.id)
    end
    render  :index
  end
 
end
