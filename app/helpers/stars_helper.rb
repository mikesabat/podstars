module StarsHelper
	def star_params
    params.require(:star).permit(:name, :bio, :link, :image)
    #these star_params might not matter. We aren't using this with the podcast model and everything works. 

  end
end
