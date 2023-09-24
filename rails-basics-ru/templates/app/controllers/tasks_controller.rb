class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def update
    if task.update(task_params)
      redirect_to task, notice: 'Task updated'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to @task, notice: 'Task created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if task.destroy
      redirect_to tasks_url, notice: 'Task deleted'
    else
      redirect_to tasks_url, status: :unprocessable_entity
    end
  end

  def show
    task
  end

  def edit
    task
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
