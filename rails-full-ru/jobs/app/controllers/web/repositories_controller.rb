# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    @repository = Repository.new(link: permitted_params[:link])

    if @repository.save
      ::RepositoryLoaderJob.perform_later(@repository)
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
    # END
  end

  def update
    # BEGIN
    @repository = Repository.find(params[:id])
    if @repository
      ::RepositoryLoaderJob.perform_later(@repository)

      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
    # END
  end

  def update_repos
    # BEGIN
    Repository.order(:asc).each do |repository|
      ::RepositoryLoaderJob.perform_later(repository)
    end
    # END
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
