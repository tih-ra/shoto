class PhotoArtController < ApplicationController
  def show
    @photos = Photo.paginate(:page => params[:page], :per_page => 15, :joins=>"JOIN albums on assets.assetable_id = albums.id AND assets.assetable_type='Album'", :conditions=>"albums.is_freeze_frames is false AND assets.thumbnail is null", :order=>"assets.created_at DESC")
  end
end
