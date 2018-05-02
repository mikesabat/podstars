module StarsHelper
	def star_params
    params.require(:star).permit(:name, :bio, :link, :image)
  end
end
