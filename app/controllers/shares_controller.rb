class SharesController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @share = @week.shares.create(share_params)
    redirect_to week_path(@week)
  end

  def destroy
    @week = Week.find(params[:week_id])
    @share = @week.shares.find(params[:id])
    @share.destroy
    redirect_to week_path(@week)
  end

  private
    def share_params
      params.require(:share).permit(:questions)
    end
end
