class PostsController < ApplicationController

  before_action :set_posts, only: [:show, :edit, :update]
	
  def index
  	@posts = Post.all
  end

  def show 
  	#binding pry
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user = User.first
  	#binding pry

  	if @post.save
  		flash[:notice] = "Your post was created"
  		redirect_to posts_path
  	else
  		render 'new'
  	end

  end

  def edit; end # ; is used as line separator 

  def update
    
    if @post.update(post_params)
      flash[:notice] = "Post was updated"
      #redirect_to post_path(@post)
      redirect_to posts_path
    else
      render 'edit'
      #render :edit - this also works
    end
  end

  private
  def post_params
	#params.require(:post).permit(:title, :url)  
	params.require(:post).permit!	
  end

  def set_posts
    @post = Post.find(params[:id])
  end

end
