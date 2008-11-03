require 'RMagick'
class Manage::PhotosController < ApplicationController

  before_filter :find_photo, :only => [:show, :edit, :update, :destroy]
    
  before_filter :login_required, :except => [:create]
  
  def edit
    respond_to do |format|
       format.html { render :layout => false }
       format.js {  }
     end
  end

  def update
    image = Magick::ImageList.new( RAILS_ROOT+"/public" + @photo.public_filename )
    image = image.rotate( params[:direction] == 'left' ? -90 : 90 )
    image.write( RAILS_ROOT+"/public" + @photo.public_filename )
    @photo.save!
    respond_to do |format|
       format.js {  }
     end
  end

  def create    
    # HTML file upload
    if params[:image]
      photo = Photo.new(params[:image])
      photo.assetable = Album.find(params[:album_id])
      photo.user = current_user
      photo.save!
      redirect_to :back
      
    # SWFUpload file upload
    elsif params[:Filedata]
      photo = Photo.create! :swf_uploaded_data => params[:Filedata]
      photo.assetable_type = params[:assetable_type]
      photo.assetable_id = params[:assetable_id]
      photo.user_id = params[:user_id]
      photo.save!
      render :text => "["+photo.public_filename(:middle)+"]["+photo.public_filename(:content)+"]["+photo.id.to_s+"]"
      #render :nothing => true
    end

  end

  def destroy
    @photo.destroy
    redirect_to :back
  end
  
  private 
  
  def find_photo
    @photo = Photo.find(params[:id])
  end
  
  def authorized?
     ['index', 'new', 'create', 'update', 'destroy'].include?(action_name) || 
     (['edit', 'update', 'destroy', 'show'].include?(action_name) && (current_user == @photo.user || admin?))
   end
end
