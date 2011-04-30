require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Bet Placing", %q{
  In order to participate in the contest
  As a user
  I want to place bets on the current season
} do

  background do
    User.create(
      :username => "cisco",
      :email    => "cisco@lfp.es",
      :password => "secret",
      :password_confirmation => "secret"
    )

    real_madrid = Team.create(:name => "Real Madrid")
    barcelona   = Team.create(:name => "Barcelona")
    sevilla     = Team.create(:name => "Sevilla")
    valencia    = Team.create(:name => "Valencia")

    Season.create(
      :number => 1,
      :matches_attributes => [
        {:team_1_id => real_madrid.id, :team_2_id => barcelona.id},
        {:team_1_id => sevilla.id,     :team_2_id => valencia.id}
      ]
    )
  end

  scenario "Place bet" do
    login_as "cisco", "secret"

    visit "/"
    click_link "Apostar"

    fill_in "bet_bet_results_attributes_0_result", :with => "1"
    fill_in "bet_bet_results_attributes_1_result", :with => "2"
    click_button "Apostar"

    page.should have_css("#flash_notice", :text => "Gracias por participar")
  end
end
