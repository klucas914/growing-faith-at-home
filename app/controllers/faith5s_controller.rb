class Faith5sController < ApplicationController
 def create
    @week = Week.find(params[:week_id])
    @faith5 = @week.faith5s.create(faith5_params)
    redirect_to week_path(@week)
  end

  def destroy
    @week = Week.find(params[:week_id])
    @faith5 = @week.faith5s.find(params[:id])
    @faith5.destroy
    redirect_to week_path(@week)
  end

  private
    def faith5_params
      params.require(:faith5).permit(:talk, :read, :share, :pray, :bless)
    end

end
