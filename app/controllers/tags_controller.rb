class TagsController < ApplicationController
	def show
		@tag = Tag.find(params[:id])
	end

	def index
		@tag = Tag.all
	end

	def destroy
		@tag = Tag.find(params[:id])
		Tag.destroy(@tag)

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to articles_path
  end

	# def destroy
  #   Tag.destroy_all
	#
  #   flash.notice = "All Tags Destroyed!"
	#
  #   redirect_to articles_path
  # end

end
