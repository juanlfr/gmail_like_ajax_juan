class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    if @task.save
      flash[:notice] = "Task created"
      respond_to do |format|
        format.html { redirect_to tasks_path}
        format.js {}
          #code en cas de requête AJAX
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
    
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    if params[:checked] = 1
      @task.update(status: true)
    else
      @task.update(status: false)
    end
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
      flash[:notice] = "Task edited"
    end
  
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
