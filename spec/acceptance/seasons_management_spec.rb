require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Create new season", %q{
  In order to let users begin betting
  As an administrator
  I want to create a new season
} do

  background do
    User.create(:username => "admin", :email => "admin@lfp.es", :password => "secret", :password_confirmation => "secret")
    Team.create(:name => "Real Madrid")
    Team.create(:name => "Barcelona")
    Team.create(:name => "Sevilla")
    Team.create(:name => "Valencia")
  end

  scenario "Create new season with correct values" do
    login_as "admin", "secret"

    visit "/seasons/new"
    fill_in "season_number", :with => 1
    select "Real Madrid", :from => "season_matches_attributes_0_team_1_id"
    select "Barcelona",   :from => "season_matches_attributes_0_team_2_id"
    select "Sevilla",     :from => "season_matches_attributes_1_team_1_id"
    select "Valencia",    :from => "season_matches_attributes_1_team_2_id"
    click_button "Guardar jornada"

    page.should have_css("#flash_notice", :text => "Jornada creada correctamente")
  end

  scenario "Create new season with incorrect values" do
    login_as "admin", "secret"

    visit "/seasons/new"
    select "Real Madrid", :from => "season_matches_attributes_0_team_1_id"
    select "Real Madrid", :from => "season_matches_attributes_0_team_2_id"
    select "Barcelona",   :from => "season_matches_attributes_1_team_1_id"
    select "Barcelona",   :from => "season_matches_attributes_1_team_2_id"
    click_button "Guardar jornada"

    page.should have_css("#flash_error", :text => "Error")
  end

  scenario "Create season with invalid user" do
    visit "/logout"
    visit "/seasons/new"

    current_path.should == login_path
  end
end
