class LookupsController < ApplicationController
	def new
		@lookup = ""
	end

	def catch
		@lookup = params[:lookup].strip
		it_lookup = @lookup.gsub(/\s+/, "+")
		puts "Searching for: #{it_lookup}"
		pod_lookup_link = "https://itunes.apple.com/search?attribute=titleTerm&entity=podcast&media=podcast&term=#{it_lookup}&limit=5&lang=en_us" 
		puts "Query itune with link: #{pod_lookup_link}"
		redirect_to new_podcast_path
		# render html: 'We have caugth the serach term'.html_safe
	end
end
