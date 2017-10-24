class CreativeResponsesController < ApplicationController
  def index
    @creative_responses = CreativeResponse.all
  end

  def create
    @week = Week.find(params[:week_id])
    @creative_response = @week.creative_responses.create(creative_response_params)
    redirect_to week_path(@week)
  end

  def destroy
    @week = Week.find(params[:week_id])
    @creative_response = @week.creative_responses.find(params[:id])
    @creative_response.destroy
    redirect_to week_path(@week)
  end

  private
    def creative_response_params
      params.require(:creative_response).permit(:response)
    end
end
