class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :starting, :ending, :all, :memo))
     if @task.save
      flash[:notice] = "スケジュールを新規追加しました"
       redirect_to :tasks
     else
       render "new"
     end
  end

  def show
    @task=Task.find(params[:id])

  end

  def edit
    @task=Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
     if @task.update(params.require(:task).permit(:title, :starting, :ending, :all, :updated, :memo))
      flash[:notice] = "スケジュールを更新しました"
       redirect_to :tasks
     else
       render "edit"
     end
  end

  def destroy
    @task = Task.find(params[:id])
     @task.destroy
     redirect_to :tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end
