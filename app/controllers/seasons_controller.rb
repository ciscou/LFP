class SeasonsController < ApplicationController
  before_filter :login_required

  def show
    @season = Season.find(params[:id])
  end

  def current
    @season = Season.current
    render :show
  end

  def new
    @season = Season.new
    2.times do
      @season.matches.build
    end
  end

  def create
    @season = Season.new(params[:season])
    if @season.save
      redirect_to season_url(@season), :notice => "Jornada creada correctamente"
    else
      flash.now[:error] = "Error"
      render :new
    end
  end
end
