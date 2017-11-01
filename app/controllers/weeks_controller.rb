class WeeksController < ApplicationController
  layout "admin", except: [:mobile_view]
  def index
  	@weeks = Week.all
  end
  
  def show
    @week = Week.find(params[:id])
  end

  def new
  	@week = Week.new
    @weeks = Week.where("queued IS FALSE").order('published_on ASC')
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

  def current_week
    @weeks = Week.current.where("queued IS TRUE")
  end

  def queue
    @weeks = Week.queue.where("queued IS TRUE").order('published_on ASC')
 
  end

  def archives
    @weeks = Week.archived.where("queued IS TRUE").order('published_on DESC')
  end

  def add_to_queue
    @week = Week.find(params[:id])

    if @week.update(queued: true)
      flash[:notice] = "#{@week.name} was successfully added to the queue! Manage and view the week through the 'Queued Weeks' tab."
      redirect_to new_week_path
    else
      flash[:alert] = "There was an error adding this week to the queue. Please try again." 
    end

  end

  #def publish
   # @week = Week.find(params[:id])
    
    #if @week.update(published: true)
     # flash[:notice] = "#{@week.name} was successfully added to current week!"
      #redirect_to current_week_weeks_path
    #else
     # flash[:alert] = "There was an error adding this week to current week. Please try again."
    #end 
  #end

  private
    def week_params
    	params.require(:week).permit(:name, :published_on, :archived_on)
    end

end
