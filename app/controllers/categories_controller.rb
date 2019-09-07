class CategoriesController < ApplicationController

	before_action :require_user, only: [:new, :create, :destroy]
	before_action :require_admin, only: [:new, :create]

	def show
		@category  = Category.find_by slug: params[:id]
	end
	
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = 'Category created'
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		#binding pry
		@category  = Category.find_by slug: params[:id]
		@category.delete
		redirect_to root_path
	end

	private 
	def category_params
		params.require(:category).permit(:name)
	end
end