class WeeksController < ApplicationController

  def index
  	@weeks = Week.all
  end
  
  def show
    @week = Week.find(params[:id])
  end

  def new
  	@week = Week.new
  end

  def edit
    @week = Week.find(params[:id])
  end

  def create
    @week = Week.new(week_params)

    if @week.save
      redirect_to @week
    else
	  render 'new'
	end
  end

  def update
    @week = Week.find(params[:id])
    if @week.update(week_params)
    	redirect_to @week
    else
      render 'edit'
    end
  end

  def destroy
  	@week = Week.find(params[:id])
  	@week.destroy

  	redirect_to weeks_path
  end

  def user_view
    @week = Week.find(params[:id])
  end

  def mobile_view
    @week = Week.find(params[:id])
  end

  private
    def week_params
    	params.require(:week).permit(:name, :published_on, :archived_on)
    end

end
