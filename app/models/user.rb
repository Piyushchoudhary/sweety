class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relations
  has_many  :glucose_levels
    
  # Method to get name of the user.
  # Login used is as following :
  # If user have first name or last name, it will be a combination of both.
  # Else, we will get it from the first part of his email address
  def get_name
    name = [first_name, last_name].join(" ")
    email.split("@").first.gsub(/[^0-9A-Za-z]/, " ") if name.blank?
    name
  end
  
end