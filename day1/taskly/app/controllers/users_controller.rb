class UsersController < ApplicationController
	def index
		users = User.all
		render json: users
	end

	def create
		user = User.create user_params
		render json: user, satus: 201
	end

	def show
		user = User.find_by(id: params[:id])
		unless user
			render json: {error: "User not found"}, status: 404
			return
		end
		render json: { name: user.name, email: user.email, task_count: user.tasks.count }
	end

	def update
		user = User.find(params[:id])
		user.update_attributes user_params
		unless user
			render json: {error: "User not found"}, status: 404
			return
		end
		render json: user
	end

	def destroy
		user = User.find(params[:id])
		unless user
			render json: {error: "User not found"}, status: 404
			return
		end
		User.destroy user
		render json: "", status: 204
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end