class CommentsController < ApplicationController
  before_filter :find_comment, :only=>[:destroy]
  before_filter :producer_or_my_content, :only=>[:destroy]
  before_filter :check_post_comment_permission, :only=>[:create]
  def create
    @comment = Comment.create(params[:comment])
  end
  def destroy
    @comment.destroy
  end
  private
  def find_comment
    @comment = Comment.find(params[:id])
  end
  def check_post_comment_permission
    if (params[:comment][:commentable_type]=="Post")
      post = Post.find(params[:comment][:commentable_id])
      !logged_in? && post.comment_status!=2 ? access_denied : true
    end
  end
  def producer_or_my_content
    producer_or_my_content_required(@comment)
  end
end
