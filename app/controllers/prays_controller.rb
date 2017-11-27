class PraysController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @pray = @week.prays.create(pray_params)
    redirect_to week_path(@week)
  end

  def update
    @week = Week.find(params[:week_id])
    @pray = @week.prays.find(params[:id])
 
    if @pray.update(pray_params)
      redirect_to week_path(@week)
    else
      render 'edit'
    end
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
