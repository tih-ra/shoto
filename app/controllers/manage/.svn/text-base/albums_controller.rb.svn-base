class Manage::AlbumsController < Manage::MainController
  
  before_filter :find_album, :only => [:show, :edit, :update, :destroy]
  
  before_filter :login_required
  
  def index
    @albums = current_user.albums.find(:all, :order=>"created_at DESC")
  end
  
  def create
    @album = current_user.albums.create(params[:album])
    if !@album.valid?
      flash[:album_notice] = "Пожалуйста укажите название альбома"
    end
      redirect_to :back
  end
  
  def update
    @album.update_attributes(params[:album])
    @album.save
    
    redirect_to manage_album_path(@album)
  end
  def cover
    album_id = session[:album].id
    photo_id = params[:id].split("_")[1]
    @album = Album.find(album_id)
    @album.cover = photo_id
    @cover = Photo.find(photo_id)
    @album.save
    render :text => "<img src='#{@cover.public_filename(:thumb)}' width='154' height='114'>"
  end

  def destroy
    @album.destroy
    redirect_to manage_albums_path
  end

  def show
    session[:album] = @album
    
  end
  
  
  private 
=begin 
  def authorized?
    ['index', 'new', 'create', 'cover', 'auto_complete_for_album_tag_list'].include?(action_name) || 
    (['edit', 'update', 'destroy', 'show', 'auto_complete_for_album_tag_list'].include?(action_name) && (current_user == @album.user || admin?))
  end
=end  
  
  def find_album
    @album = Album.find(params[:id])
  end
  
end