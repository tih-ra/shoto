class WelcomeController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5, :conditions=>"posts.is_video=0 AND posts.id NOT IN (SELECT post_id FROM events_posts)", :order=>"posts.created_at DESC")
    
  end
end
