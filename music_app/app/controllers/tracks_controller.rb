class TracksController < ApplicationController
  def new 
    @album = Album.find(params[:album_id])
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    track = Track.new(track_params)
    album = Album.find(params[:album_id])
    track.album_id = params[:album_id]
    if track.save
      redirect_to album_url(params[:album_id])
    else
      flash.now[:errors] = "Invalid track"
    end
  end

  private
  def track_params
    params.require(:track).permit(:title, :lyrics, :ord)
  end
end