class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post).permit(:title, :description))
	  #Notice how the title and description attributes are now nested within the post hash? That's why we needed to add the require method. But Rails wants us to be conscious of which attributes we allow to be updated in our database, so we must also permit the title and description in the nested hash. Using strong parameters like this will allow ActiveRecord to use mass assignment without trouble.
	  redirect_to post_path(@post)
	end
end