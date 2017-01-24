class GalleriesController < ApplicationController

	def index
		@gallery = Gallery.all
	end

	def new
		@gallery = Gallery.new
		4.times {@gallery.photos.build}
	end

  def show
  	@gallery = Gallery.find(params[:id])
  end

  def create
  	@gallery = Gallery.new(params[:gallery])
  	if @gallery.save
  		redirect_to @gallery
  	else
  		render :action => 'new'
  	end
  end
end
