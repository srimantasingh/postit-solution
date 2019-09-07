class PostsController < ApplicationController

  before_action :set_posts, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index]
  before_action :require_creator, only: [:edit, :update]
	
  def index
    @posts = Post.limit(Post::PER_PAGE).offset(params[:offset])
  	#@posts = Post.all.sort_by{|x| x.total_votes}.reverse
    @pages = Post.all.size/Post::PER_PAGE 
    @pages += 1 if Post.all.size % Post::PER_PAGE > 0
  end

  def show 
  	#binding pry
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user = current_user
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

  def vote
    #binding pry
    @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])

    respond_to do |format|
      format.html {
        if @vote.valid?
          flash[:notice] = 'Your vote was counted'
        else
          flash[:error] = "You can vote only once"
        end
        redirect_to :back
      }
      format.js
    end
    
    
  end

  def set_posts
    @post = Post.find_by(slug: params[:id])
  end

  def require_creator
    access_denied unless logged_in? and (current_user == @post.user || current_user.admin?)
  end

  private
  def post_params
	   #params.require(:post).permit(:title, :url)  
	   params.require(:post).permit!	
  end

 

end
