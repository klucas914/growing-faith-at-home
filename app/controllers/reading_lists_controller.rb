class ReadingListsController < ApplicationController
  def index
    @reading_lists = ReadingList.all
  end
  
  def new
  end

  def edit
    @week = Week.find(params[:week_id])
    @reading_list = @week.reading_lists.find(params[:id])
  end
  
  def update
    @week = Week.find(params[:week_id])
    @reading_list = @week.reading_lists.find(params[:id])
 
    if @reading_list.update(reading_list_params)
      redirect_to week_path(@week)
    else
      render 'edit'
    end
  end

  def create
    @week = Week.find(params[:week_id])
    @reading_list= @week.reading_lists.create(reading_list_params)
    redirect_to week_path(@week)
  end

  def destroy
    @week = Week.find(params[:week_id])
    @reading_list = @week.reading_lists.find(params[:id])
    @reading_list.destroy
    redirect_to week_path(@week)
  end

  private
    def reading_list_params
      params.require(:reading_list).permit(:day, :verse, :title, :scripture_text)
    end
end
