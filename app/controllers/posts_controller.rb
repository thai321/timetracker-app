class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.post_by(current_user)
    # @posts = Post.includes(:user).where(user: current_user) # much faster and better SQL
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def edit # only user can edit their own post with pundit gem
    authorize @post # from /policies/post_policy.rb
  end

  def update #only user can update their own post with pundit gem
    authorize @post # from /policies/post_policy.rb
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post was deleted successfully'
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
