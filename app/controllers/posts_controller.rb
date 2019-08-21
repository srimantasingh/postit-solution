class PostsController < ApplicationController
	
  def index
  	#render index
  	@posts = Post.all
  end

  def show 
  	#binding pry
  	@post = Post.find(params[:id])
  end

end
