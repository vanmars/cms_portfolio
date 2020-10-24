class PostsController < ApplicationController
  before_action except: [:index, :show] do 
    unless is_admin?
      flash[:alert] = 'You do not have access to this content.'
      redirect_to posts_path 
      end
  end
  
  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:notice] = 'Post successfully created!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'There was an error! Please try again.'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post successfully updated!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'There was an error! Please try again.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post successfully deleted!'
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end