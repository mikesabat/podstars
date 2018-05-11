class LookupsController < ApplicationController
	def new
		if params[:lookup]
			@lookup = params[:lookup].strip
			it_lookup = @lookup.gsub(/\s+/, "+")
			pod_lookup_link = "https://itunes.apple.com/search?attribute=titleTerm&entity=podcast&media=podcast&term=#{it_lookup}&limit=5&lang=en_us" 


			response = HTTParty.get(pod_lookup_link, format: :plain)
			json_response = JSON.parse response, symbolize_names: true

			num_of_results = json_response[:resultCount]
			results = json_response[:results]

			@actual_data = results[0]

			@podcast = {:name => @actual_data[:collectionName], :host => @actual_data[:artistName], :feed => @actual_data[:feedUrl], :image_url => @actual_data[:artworkUrl60], :big_image =>@actual_data[:artworkUrl600]}

		else
			
		end
	end

end