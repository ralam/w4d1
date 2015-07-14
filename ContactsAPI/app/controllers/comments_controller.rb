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
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.commentable_type = find_commentable_type
    @comment.commentable_id = find_commentable_id

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
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

  def find_commentable_type
    params.each do |name, value|
      if name =~ /(.+)_id$/
        # $1 returns first thing this regex matches
        return $1.classify.constantize
      end
    end
    nil
  end

  def find_commentable_id
    params.each do |name, value|
      if name =~ /(.+)_id$/
        # $1 returns first thing this regex matches
        return value
      end
    end
    nil
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
