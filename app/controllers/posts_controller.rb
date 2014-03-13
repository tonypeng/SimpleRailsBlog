class PostsController < ApplicationController

	include ActionView::Helpers::TextHelper

	def initialize
		super()
		# uncomment to allow posting from the web interface with /posts/new
		@allow_post_from_web = true
	end

	def index
		@posts = Post.find(:all, :order => 'id DESC')
		@page_title = "Index"
	end

	def create

		if not @allow_post_from_web then redirect_to '/'; return; end

		@post = Post.new(post_params())
		@post.save

		redirect_to @post
	end

	def new
		if not @allow_post_from_web then redirect_to '/'; return; end
	end

	def edit
		redirect_to '/';
	end

	def show
		@post = Post.find(params[:id])
		
		@page_title = @post.title
	end

	def update
		redirect_to '/';
	end

	def destroy
		redirect_to '/';
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end

end
