module ReportsHelper
  def report_range_display type, date
    case type
    when 'daily'
      date
    when 'month_to_date'
      Date.parse(date).at_beginning_of_month.to_s + " to " + Date.parse(date).to_s
    when 'monthly'
      Date.parse(date).prev_month.to_s + " to " + Date.parse(date).to_s
    end
  end
end
