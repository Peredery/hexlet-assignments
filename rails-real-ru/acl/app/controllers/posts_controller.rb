# frozen_string_literal: true

class PostsController < ApplicationController
  include Pundit::Authorization
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def new
    authorize Post
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def edit
    set_post
    authorize @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    set_post
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def create
    authorize Post

    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    set_post
    authorize @post

    if @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    else
      redirect_to posts_url, alert: 'Post was not destroyed.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  # END
end
