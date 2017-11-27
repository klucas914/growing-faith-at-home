class MemoryVersesController < ApplicationController
  def create
    @week = Week.find(params[:week_id])
    @memory_verse = @week.memory_verses.create(memory_verse_params)
    redirect_to week_path(@week)
  end

  def update
    @week = Week.find(params[:week_id])
    @memory_verse = @week.memory_verses.find(params[:id])
 
    if @memory_verse.update(memory_verse_params)
      redirect_to week_path(@week)
    else
      render 'edit'
    end
  end

  def index
    @memory_verses = MemoryVerse.all
  end

  def destroy
    @week = Week.find(params[:week_id])
    @memory_verse = @week.memory_verses.find(params[:id])
    @memory_verse.destroy
    redirect_to week_path(@week)
  end

  private
    def memory_verse_params
      params.require(:memory_verse).permit(:text, :verse_address)
    end
end
