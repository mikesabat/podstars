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

		response = HTTParty.get(pod_lookup_link, format: :plain)
		# JSON.parse response, symbolize_names: true
		json_response = JSON.parse response, symbolize_names: true

		puts json_response.class #hash
		results = json_response[:results]

		puts results

		puts results.class #array
		actual_data = results[0]
		puts actual_data

		puts "The above block is a...."
		puts actual_data.class

		artist_name = actual_data[:artistName]
		puts artist_name

		redirect_to new_podcast_path
		# render html: 'We have caugth the serach term'.html_safe
	end
end