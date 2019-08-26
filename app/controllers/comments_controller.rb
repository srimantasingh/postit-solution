class CommentsController < ApplicationController 
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.user = User.first

		if @comment.save
			flash[:notice] = "Your Comment is saved"
			redirect_to post_path(@path)
		else
			render 'posts/show'
		end

	end
end