require 'rails_helper'
include Warden::Test::Helpers
include Devise::TestHelpers 

RSpec.describe "Reports", type: :feature do
  before :each do
    @user = User.create(:email => 'user@example.com', :password => 'password', :confirmed_at => Time.now)
    login_as @user, :scope => :user
  end
  
  describe "POST /reports" do
    it "Gets reports for the day" do
      [39,98,64,85].each do |val|
        GlucoseLevel.create(level: val, registered_date: Date.today, user_id: @user.id)
      end
      visit reports_path
      fill_in "Date", :with => Date.today.strftime("%Y-%m-%d")
      click_button "Get Reports"
      expect(page).to have_content("Data")
      expect(page).to have_content("Maximum Value : 98")
      expect(page).to have_content("Minimum Value : 39")
      expect(page).to have_content("Average Value : 71.5")
    end
  end
end
