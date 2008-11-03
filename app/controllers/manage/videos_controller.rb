class Manage::VideosController < Manage::MainController
  before_filter :login_required, :except => [:create]
   def index
     @videos = current_user.videos.paginate(:page => params[:page], :per_page => 5, :order=>"created_at DESC")
   end
   def create    
    # HTML file upload
      #video = Video.new(params[:video])
      video = Video.create! :swf_uploaded_data => params[:Filedata]
      video.user_id = params[:user_id]
      video.save!
      redirect_to manage_videos_path
    end
    def destroy
      @video = Video.find(params[:id])
      @video.destroy
      redirect_to manage_videos_path
    end
end
