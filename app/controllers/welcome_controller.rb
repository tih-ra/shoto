class WelcomeController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 2, :conditions=>{:is_public=>true}, :order=>"posts.created_at DESC")
  end
end
