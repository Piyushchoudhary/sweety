require 'rails_helper'
include Warden::Test::Helpers
include Devise::TestHelpers 

RSpec.describe "GlucoseLevels", type: :feature do

  before :each do
    @user = User.create(:email => 'user@example.com', :password => 'password', :confirmed_at => Time.now)
    login_as @user, :scope => :user
  end
  
  describe "GET /glucose_levels" do
    it "displays glucose levels for today" do
      visit glucose_levels_path
      expect(page).to have_content("Glucose Level Summary for the day")
      expect(page).to have_content(Date.today.strftime("#{Date.today.day.ordinalize} %B %Y"))
    end
  end

  describe "POST /glucose_levels" do
    it "creates glucose levels" do
      visit new_glucose_level_path
      fill_in "Level", :with => "69"
      click_button "Save"
      expect(page).to have_content("Glucose level added successfully.")
      expect(page).to have_content("69")
    end
  end

  describe "POST /glucose_levels" do
    it "raises error for creating more than 4 glucose levels a day" do
      [39,98,64,85].each do |val|
        GlucoseLevel.create(level: val, registered_date: Date.today, user_id: @user.id)
      end
      visit new_glucose_level_path
      fill_in "Level", :with => "69"
      click_button "Save"
      expect(page).to have_content("Glucose Level can not be added more than 4 times a day")
    end
  end
end
