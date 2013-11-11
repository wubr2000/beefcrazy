class CommentsController < ApplicationController
  before_action :set_restaurant
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @restaurant.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @restaurant.comments.create(comment_strong_params)

    if @comment.save
      redirect_to restaurant_comments_path(@restaurant), notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
    
  end

  def edit
    #edit comment
  end

  def show
    @comment = Comment.find_by(params[:restaurant_id])
  end

  def update
    #updates comment
    if @comment.update(comment_strong_params)
      redirect_to restaurant_comments_path(@restaurant), notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy
    #destroy
    @comment.destroy
    redirect_to restaurant_comments_path(@restaurant), notice: 'Comment was successfully deleted.'
  end

private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_comment
    @comment = @restaurant.comments.find(params[:id])
  end

  def comment_strong_params
    params.require(:comment).permit(
      :restaurant_id, 
      :commenter,
      :remark
      )
  end

end