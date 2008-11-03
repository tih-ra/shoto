class VideosController < ApplicationController
  def show
     @posts = Post.paginate(:page => params[:page], :per_page => 5, :conditions=>{:is_video=>true},:order=>"created_at DESC")
   end
  
end
