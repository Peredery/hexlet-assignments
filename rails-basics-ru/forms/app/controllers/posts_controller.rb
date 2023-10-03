class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :set_posts, only: [:index]

  def index
    @posts
  end

  def show
   @post
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post_url(post), notice: 'Post created'
    else
      redirect_to new_post_url, status: :unprocessable_entity
    end
  end

  def edit
    @post
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: 'Post updated'
    else
      redirect_to post_url(@post), status: :unprocessable_entity
    end
  end

  def new
    @post = Post.create
  end

  def destroy
    if @post.destroy
      redirect_to posts_url, notice: 'Task deleted'
    else
      redirect_to posts_url, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_posts
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:id, :title, :body, :summary, :published)
  end
end
