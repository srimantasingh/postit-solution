class CommentsController < ApplicationController 

	before_action :require_user
	before_action :set_posts, only: [:create, :vote]


	def create
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.user = current_user

		if @comment.save
			flash[:notice] = "Your Comment is saved"
			redirect_to post_path(@post)
		else
			render 'posts/show'
		end

	end

	def vote
		#binding pry
		@comment = Comment.find(params[:id])
		vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
		if vote.valid?
    		flash[:notice] = 'Your vote was counted'
    	else
    		flash[:error] = 'You can vote only once'
    	end
    	redirect_to :back
	end

	def set_posts
		@post = Post.find(params[:post_id])
	end

	
end