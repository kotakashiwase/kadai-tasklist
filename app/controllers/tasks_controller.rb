class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] ='taskが正常に投稿されました'
    else
      flash.now[:danger] = 'taskが投稿されませんでした'
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'taskは正常に更新されました'
      redirect_to @task
    else
      flash[:success] = 'taskは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'taskは正常に削除されました'
    redirect_to task_url
  end
  
  private
  
  #Strong parameter
  def task_params
    params_require(:task).permit(:content)
  end

end
