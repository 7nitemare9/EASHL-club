class PostsController < ApplicationController
	before_filter :is_admin, :except => :index
        
        def is_admin
          if @current_user
            unless @current_user.user_name == "admin"  
              redirect_to root_path
            end
          else
            redirect_to root_path
          end 
        end


	def index
		@posts = Post.all.reverse
	end

	def new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to root_path
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to root_path
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			redirect_to root_path
		end
	end
	
	private
        def post_params
          params.require(:post).permit(:title, :text)
        end

end
