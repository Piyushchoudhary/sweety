class GlucoseLevel < ActiveRecord::Base
  
  # Relations
  belongs_to  :user
  
  # Validations
  validates   :level,           presence: true, numericality: { only_integer: true }
  validates   :registered_date, presence: true
  validate    :daily_limit_check,     on: :create
  

  # Method to get the glucose levels between two specified dates and compute the results from them
  # Desired result parameters are
  # max - maximum glucose level between two dates
  # min - minimum glucose level between two dates
  # avg - average glucose level between two dates
  def self.get_report_data date1, date2, user_id
    sum = 0
    min = 0
    max = 0
    count = 0
    where(:user_id => user_id, :registered_date => Date.parse(date1)..Date.parse(date2)).select(&:level).each do |gl|
      sum += gl.level
      min = gl.level if min == 0 || min > gl.level
      max = gl.level if max < gl.level
      count += 1
    end
    return min, max, ((sum.to_f/count).round(3) rescue 0)
  end

  private

  # Method to check the daily limit for the glucose level entries.
  # Can not be more than 4 for a particular date.
  def daily_limit_check
    errors.add(:base, "Glucose Level can not be added more than 4 times a day.") if GlucoseLevel.where(:user_id => user_id, :registered_date => registered_date).size >= 4
  end
end
