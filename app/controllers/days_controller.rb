class DaysController < ApplicationController
  def create
    @week= Week.find(params[:week_id])
    @reading_list = @week.reading_list(find[:reading_list_id])
    #@reading_list = ReadingList.find(params[:reading_list_id])
    @day = @reading_list.days.create(day_params)
    redirect_to week_path(@reading_list.week)
  end

  def destroy
    @reading_list = ReadingList.find(params[:reading_list_id])
    @day = @reading_list.days.find(params[:id])
    @day.destroy
    redirect_to week_path(@reading_list.week)
  end

  private
    def day_params
      params.require(:day).permit(:date, :verse, :title, :reading_list_id)
    end
end
