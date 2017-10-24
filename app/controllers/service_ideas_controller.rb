class ServiceIdeasController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @service_idea = @week.service_ideas.create(service_idea_params)
    redirect_to week_path(@week)
  end

  def destroy
    @week = Week.find(params[:week_id])
    @service_idea = @week.service_ideas.find(params[:id])
    @service_idea.destroy
    redirect_to week_path(@week)
  end

  private
    def service_idea_params
      params.require(:service_idea).permit(:idea)
    end
end
