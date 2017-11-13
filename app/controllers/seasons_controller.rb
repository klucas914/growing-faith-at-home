class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def new
  	@season = Season.new
  end

  def edit
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(season_params)

    if @season.save
      redirect_to seasons_path
    else
	  render 'new'
	end
  end

  def update
    @season = Season.find(params[:id])
    if @season.update(season_params)
    	redirect_to seasons_path
    else
      render 'edit'
    end
  end

  def destroy
  	@season = Season.find(params[:id])
  	@season.destroy

  	redirect_to seasons_path
  end

  private
    def season_params
    	params.require(:season).permit(:church_season, :description)
    end
end
