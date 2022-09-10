class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy] 
  
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_user = current_admin_user
    if @post.save
      redirect_to @post
    else
      render 'posts_path'
    end
  end

  def show; end

  def edit; end
  
  def update
    @post.admin_user = current_admin_user
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, alert: 'You are not authorized'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
 
 
  private


  def authorize
    authorize @post
  end

  def find_post
    @post = Post.find(params[:id])  
  end

  def find_user
    unless @post.admin_user == current_admin_user 
      redirect_to posts_path, alert: 'You are not authorized'
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :admin_user_id)
  end

end
