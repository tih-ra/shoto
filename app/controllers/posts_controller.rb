class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10, :order=>"posts.created_at DESC")
    
  end
  def reports
    if params[:id] == "all"
      @posts = Post.paginate(:page => params[:page], :per_page => 5, :joins=>"join events_posts on events_posts.post_id = posts.id", :order=>"posts.created_at DESC")
    else
      @event = Event.find(params[:id])
      @posts = @event.posts.paginate(:page => params[:page], :per_page => 5, :order=>"created_at DESC")
    end
    render :action=>:index
  end
  def show
    @post = Post.find(params[:id])
  end
  def tag
     #params[:id] = params[:id].gsub(/~dot~/, ".")
     #@tag = params[:id]
     @posts = Post.paginate_tagged_with(params[:id], :page => params[:page], :conditions=>{:is_public=>true}, :per_page => 5, :order => "posts.created_at DESC")
     render :action=>:index
  end
end
