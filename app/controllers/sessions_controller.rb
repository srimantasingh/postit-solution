class SessionsController < ApplicationController
	def show
		#@user = User.new
	end

	def create
		user = User.where(username: params[:username]).first
		#user = User.find_by(username: params[:username])

		if user && user.authenticate(params[:password])
			flash[:notice] = "Welcome you have logged in"
			session[:user_id] = user.id
			redirect_to root_path
		else
			flash[:notice] = "There is something wrong with your username or password"
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have logged out"
		redirect_to root_path
	end
end