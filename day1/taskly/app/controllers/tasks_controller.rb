class TasksController < ApplicationController
	before_filter :find_user, only: [:show, :index, :create, :update, :destroy]

	def index
		tasks = @user.tasks
		render json: tasks
	end

	def create
		# task = Task.new tasks_params
		# task.completion = nil
		# @user.tasks.push(task) 
		task = create(tasks_params.merge(
			{completion: nil, user_id: params[:user_id]})) # merge adds or overwrites
		render json: task, status: 201
	end

	def destroy
		# task = Task.find(params[:id])
		# task.destroy
		@user.tasks.find(params[:id]).destroy
		render json: 'Task deleted correctly'
	end

	def show
		task = @user.tasks.find(params[:id])
		render json: task
	end

	def update
		task = @user.tasks.find(params[:id])
		task.update tasks_params
		render json: task
	end

	private

	def tasks_params
		params.require(:task).permit(:name) 
	end

	def find_user
		@user = User.find(params[:id])
	end
end