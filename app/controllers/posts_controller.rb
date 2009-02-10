class PostsController < ApplicationController
  before_filter :default_conditions
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10, :conditions=>@default_conditions, :order=>"posts.created_at DESC")
    
  end
  def show
    @post = Post.find(params[:id], :conditions=>@default_conditions)
  end
  def tag
     #params[:id] = params[:id].gsub(/~dot~/, ".")
     #@tag = params[:id]
     @posts = Post.paginate_tagged_with(params[:id], :page => params[:page], :conditions=>@default_conditions, :per_page => 5, :order => "posts.created_at DESC")
     render :action=>:index
  end
  private
  def default_conditions
    @default_conditions = {:is_public=>true}#"is_public = 1 #{!logged_in? ? 'AND access_level=0' : ''}"
  end
end
