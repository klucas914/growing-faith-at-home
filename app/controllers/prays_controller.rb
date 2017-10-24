class PraysController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @pray = @week.prays.create(pray_params)
    redirect_to week_path(@week)
  end

  def destroy
    @week = Week.find(params[:week_id])
    @pray = @week.prays.find(params[:id])
    @pray.destroy
    redirect_to week_path(@week)
  end

  private
    def pray_params
      params.require(:pray).permit(:prayer)
    end
end
