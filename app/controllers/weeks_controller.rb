class WeeksController < ApplicationController
  layout "admin", except: [:current, :mobile_view]
  def index
  	@weeks = Week.all
  end
  
  def show
    @week = Week.find(params[:id])
    @seasons = Season.all
  end

  def new
  	@week = Week.new
    @weeks = Week.where("queued IS FALSE").order('published_on ASC')
    @seasons = Season.all
  end

  def edit
    @week = Week.find(params[:id])
    @seasons = Season.all
  end

  def create
    @week = Week.new(week_params)
    @seasons = Season.all
    
    if @week.save
      redirect_to @week
    else
	  render 'new'
	end
  end

  def update
    @week = Week.find(params[:id])
    @seasons = Season.all
    if @week.update(week_params)
    	redirect_to @week
    else
      render 'edit'
    end
  end

  def destroy
  	@week = Week.find(params[:id])
  	@week.destroy

  	redirect_to new_week_path
  end

  def user_view
    @week = Week.find(params[:id])
  end

  def mobile_view
    @week = Week.find(params[:id])
    @seasons = Season.all
  end

  def current_week
    @weeks = Week
      .current
      .where("queued IS TRUE")
    @seasons = Season.all
  end

  def current
    week = Week
      .current
      .where("queued IS TRUE")
      .order('published_on ASC, id ASC')
      .first
    if week
      redirect_to mobile_view_week_path(week)
    else
      render :current
    end  
  end

  def manage_weeks_current
    @week = Week.find(params[:id])
    @seasons = Season.all
  end

  def queue
    @weeks = Week
      .queue
      .where("queued IS TRUE")
      .order('published_on ASC, id ASC')
    @seasons = Season.all
  end

  def manage_weeks_queue
    @week = Week.find(params[:id])
    @seasons = Season.all
  end

  def archives
    @weeks = Week.archived.where("queued IS TRUE").order('published_on DESC')
    @seasons = Season.all
  end

  def manage_weeks_archived
    @week = Week.find(params[:id])
    @seasons = Season.all
  end

  def user_view_archived
    @week = Week.find(params[:id])
    @seasons = Season.all
  end

  def mark_complete
    @week = Week.find(params[:id])
    @seasons = Season.all

    if @week.update(completed: true)
      flash[:notice] = "#{@week.name} has been marked complete. You can now add the week to the queue. You can still edit the week via Manage Weeks."
      redirect_to new_week_path
    else
      flash[:alert] = "There was an error marking this week complete. Please try again."
    end
  end
  
  def add_to_queue
    @week = Week.find(params[:id])
    @seasons = Season.all

    if @week.update(queued: true)
      flash[:notice] = "#{@week.name} was successfully added to the queue! Manage and view the week through the 'Queued Weeks' tab."
      redirect_to new_week_path
    else
      flash[:alert] = "There was an error adding this week to the queue. Please try again." 
    end

  end
  
  def remove_from_queue
    @week = Week.find(params[:id])
    @seasons = Season.all

    if @week.update(queued: false)
      flash[:notice] = "#{@week.name} was successfully removed from the queue! Manage and view the week in New Weeks."
      redirect_to queue_weeks_path
    else
      flash[:alert] = "There was an error removing this week to the queue. Please try again." 
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
    	params.require(:week).permit(:name, :published_on, :archived_on, :season_id)
    end

end
