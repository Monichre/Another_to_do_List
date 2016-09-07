class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
  end
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def show
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to list_task_path
    else
      render :edit
    end
  end
  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:description)
  end
end
