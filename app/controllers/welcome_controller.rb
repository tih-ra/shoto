class WelcomeController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 2, :conditions=>"is_public = 1 #{!logged_in? ? 'AND access_level=0' : ''}", :order=>"posts.created_at DESC")
  end
end
