class TasksController < ApplicationController
  def index
    @categories = Category.all
    @incomplete_tasks = Task.incomplete
    @complete_tasks = Task.complete
    @task = Task.new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @task.status = 'incomplete'
    if @task.save
      redirect_to tasks_path
    else
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all  # เพิ่มบรรทัดนี้
    render :edit_work 
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to category_path(@task.category), notice: "Task was successfully updated."
    else
      render :edit_work  
    end
  end
  
  

  def complete
    @task = Task.find(params[:id])
    @task.update(status: 'complete')
    redirect_to category_path(@task.category), notice: "Task marked as complete."
  end

  def incomplete
    @task = Task.find(params[:id])
    @task.update(status: 'incomplete')
    redirect_to category_path(@task.category), notice: "Task marked as incomplete."
  end
  

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully deleted."
  end

  private

  def task_params
    params.require(:task).permit(:name, :category_id)
  end
end
