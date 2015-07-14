class CommentsController < ApplicationController

  def index
    @commentable = find_commentable
    render json: @commentable.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    render json: @comment
  end

  def update
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        # $1 returns first thing this regex matches
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
