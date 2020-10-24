class CommentsController < ApplicationController
  before_action except: [:new, :create, :show] do 
    unless is_admin? || is_creator?
      flash[:alert] = 'You do not have access to this content.' 
      redirect_to post_path(Post.find(params[:post_id])) 
      end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    render :new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save 
      flash[:notice] = 'Comment successfully added!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'There was an error! Please try again.'
      render :new
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    render :edit
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = 'Comment successfully updated!'
      redirect_to post_path(@comment.post)
    else 
      flash[:alert] = 'There was an error! Please try again.'
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end