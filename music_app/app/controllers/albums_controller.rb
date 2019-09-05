class AlbumsController < ApplicationController

  def new 
     @band = Band.find(params[:band_id])
    render :new
  end

  def create
    album = Album.new(album_params)
    @band = Band.find(params[:band_id])
    album.band_id = @band.id
    if album.save
      redirect_to band_url(params[:band_id])
    else
      flash.now[:errors] = "Invalid album"
    end

  end

  def show
    @album = Album.find(params[:id])
    render :show
  end




  private
    def album_params
      params.require(:album).permit(:title, :year, :album_type)
    end
end