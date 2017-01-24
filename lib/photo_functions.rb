module PhotoFunctions
	def photo_uploader
    @program = Program.find(params[:id])
    render "upload_photos"
  end

  def upload_photos
    logger.debug("----------------->")
    logger.debug(params.inspect)

    @program = Program.find(params[:program][:id])
    @program.assets_array=params[:program][:assets_attributes]
    @program.save
    #@program.update_attributes(params[:program])
    #params[:program][:assets_attributes]["0"]["photo"].each do |photo|
    #  Asset.create(photo)
    #end
    redirect_to :back
  end
end