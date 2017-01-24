class PhotosController < ApplicationController
	def index
    @photos = Photo.all
    # render :json => @photos.collect { |p| p.to_jq_upload }.to_json
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:image])
    if @photo.save
      redirect_to photos_path
    else
      render :action => 'new'
    end
    # p_attr = params[:photo]
    # p_attr[:file] = params[:photo][:file].first if params[:photo][:file].class == Array

    # @photo = Photo.new(p_attr)
    # if @photo.save
    #   respond_to do |format|
    #     format.html {  
    #       render :json => [@photo.to_jq_upload].to_json, 
    #       :content_type => 'text/html',
    #       :layout => false
    #     }
    #     format.json {  
    #       render :json => { :files => [@photo.to_jq_upload] }			
    #     }
    #   end
    # else 
    #   render :json => [{:error => "custom_failure"}], :status => 304
    # end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render :json => true
  end
end
