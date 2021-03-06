class BlessesController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @bless = @week.blesses.create(bless_params)
    redirect_to week_path(@week)
  end

  def update
    @week = Week.find(params[:week_id])
    @bless = @week.blesses.find(params[:id])
 
    if @bless.update(bless_params)
      redirect_to week_path(@week)
    else
      render 'edit'
    end
  end

  def destroy
    @week = Week.find(params[:week_id])
    @bless = @week.blesses.find(params[:id])
    @bless.destroy
    redirect_to week_path(@week)
  end

  private
    def bless_params
      params.require(:bless).permit(:blessing)
    end
end
