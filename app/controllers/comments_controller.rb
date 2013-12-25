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
    @current_user = User.find_by(id: session[:user_id]).name

    if @comment.commenter != @current_user
      redirect_to restaurant_comments_path(@restaurant), notice: "You are not the author of this comment. You can only edit comments that you have created."
    end

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
    @current_user = User.find_by(id: session[:user_id]).name

    if @comment.commenter != @current_user
      redirect_to restaurant_comments_path(@restaurant), notice: "You are not the author of this comment. You can only delete comments that you have created."
    else
      @comment.destroy
      redirect_to restaurant_comments_path(@restaurant), notice: 'Comment was successfully deleted.'
    end

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