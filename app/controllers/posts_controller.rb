class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :check]
  before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = "Your post was created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post was updated!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:warning] = "Your post was deleted!"
    redirect_to posts_path
  end

  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def show
  end

  def check
    check = Check.create(checkable: @post, creator: current_user, check: params[:check])
    
    if check.valid?
      flash[:notice] = "You checked the post!"  
    else
      flash[:danger] = "You have already checked the post!"
    end
    
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end