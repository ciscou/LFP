module HelperMethods
  def login_as login, password
    visit "/login"
    fill_in "login", :with => login
    fill_in "password", :with => password
    click_button "Log in"
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
