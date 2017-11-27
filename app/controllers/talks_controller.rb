class TalksController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @talk = @week.talks.create(talk_params)
    redirect_to week_path(@week)
  end

  def update
    @week = Week.find(params[:week_id])
    @talk = @week.talks.find(params[:id])
 
    if @talk.update(talk_params)
      redirect_to week_path(@week)
    else
      render 'edit'
    end
  end

  def destroy
    @week = Week.find(params[:week_id])
    @talk = @week.talks.find(params[:id])
    @talk.destroy
    redirect_to week_path(@week)
  end

  private
    def talk_params
      params.require(:talk).permit(:question)
    end
end
