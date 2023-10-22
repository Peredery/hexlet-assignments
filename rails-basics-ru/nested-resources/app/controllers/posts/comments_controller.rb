class Posts::CommentsController < Posts::ApplicationController
  before_action :set_comment, only: %i[update edit destroy show]

  def create

    @comment = resource_post.comments.build(comment_params)

    if @comment.save
      redirect_to resource_post, notice: 'Comment was successfully created.'
    else
      redirect_to post_path(resource_post), status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @comment.destroy

    redirect_to resource_post
  end

  def update
    if @comment.update(comment_params)
      redirect_to resource_post, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @comment
  end

  def comment_params
    params.require(:post_comment).permit(:body)
  end

  def set_comment
    @comment = PostComment.find(params[:id])
  end
end
