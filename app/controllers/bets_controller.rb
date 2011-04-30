class BetsController < ApplicationController
  def new
    @season = Season.find(params[:season_id])
    @bet = @season.bets.find_or_initialize_by_user_id(current_user.id)
    if @bet.new_record?
      @season.matches.each do |match|
        @bet.bet_results.build(:match => match)
      end
    end
  end

  def create
    @season = Season.find(params[:season_id])
    @bet = @season.bets.build(params[:bet])
    @bet.user = current_user
    if @bet.save
      redirect_to root_url, :notice => "Gracias por participar"
    else
      render :new
    end
  end
end
