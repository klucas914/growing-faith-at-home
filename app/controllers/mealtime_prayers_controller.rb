class MealtimePrayersController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @mealtime_prayer = @week.mealtime_prayers.create(mealtime_prayer_params)
    redirect_to week_path(@week)
  end

  def update
    @week = Week.find(params[:week_id])
    @mealtime_prayer = @week.mealtime_prayers.find(params[:id])
 
    if @mealtime_prayer.update(mealtime_prayer_params)
      redirect_to week_path(@week)
    else
      render 'edit'
    end
  end

  def destroy
    @week = Week.find(params[:week_id])
    @mealtime_prayer = @week.mealtime_prayers.find(params[:id])
    @mealtime_prayer.destroy
    redirect_to week_path(@week)
  end

  private
    def mealtime_prayer_params
      params.require(:mealtime_prayer).permit(:mealtime_prayer)
    end
end
