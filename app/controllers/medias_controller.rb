class MediasController < ApplicationController

	def index
		@medias = Media.all.reverse
	end

	def new
	end

	def create
		@media = Media.new(media_params)
		@media.save
		redirect_to root_path
	end

	def update
		@media = Media.find(params[:id])
		if @media.update_attributes(params[:media])
			redirect_to root_path
		end
	end

	def show
		@media = Media.find(params[:id])
	end

	def edit
		@media = Media.find(params[:id])
	end

	def destroy
		@media = Media.find(params[:id])
		if @media.destroy
			redirect_to root_path
		end
	end
	
	private
		def media_params
			params.require(:media).permit(:title, :text)
		end
end
