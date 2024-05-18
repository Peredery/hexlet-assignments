# frozen_string_literal: true

class Web::Movies::ReviewsController < Web::Movies::ApplicationController
  def index
    @reviews = resource_movie.reviews.all
  end

  def edit
    @review = resource_movie.reviews.find(params[:id])
  end

  def update
    @review = resource_movie.reviews.find(params[:id])

    if @review.update(review_params)
      redirect_to movie_reviews_url(resource_movie), notice: t('.success')
    else
      render edit, status: :unprocessable_entity
    end
  end

  def new
    @review = resource_movie.reviews.build
  end

  def create
    @review = resource_movie.reviews.build(review_params)

    if @review.save
      redirect_to movie_reviews_url(resource_movie), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = resource_movie.reviews.find(params[:id])

    if @review.delete
      redirect_to movie_reviews_url(resource_movie), notice: t('.success')
    else
      redirect_to movie_reviews_url(resource_movie), notice: t('.fail')
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
