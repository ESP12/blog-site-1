class PostsController < ApplicationController
	# Maind page showing added post
	def index
		@post = Post.all.order('created_at DESC')
	end
	# Redirection to New Post page
	def new
		@post  = Post.new
	end
	# Creating new post
	def create 
		@post  = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end
	#showing created post
	def show
		@post = Post.find(params[:id])
	end
	# editing created post
	def edit
		@post = Post.find(params[:id])
	end
	# Updating edited post
	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end
	# deleting created post
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
