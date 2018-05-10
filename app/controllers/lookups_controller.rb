class LookupsController < ApplicationController
	def new
		if params[:lookup]
			@lookup = params[:lookup].strip
			it_lookup = @lookup.gsub(/\s+/, "+")
			pod_lookup_link = "https://itunes.apple.com/search?attribute=titleTerm&entity=podcast&media=podcast&term=#{it_lookup}&limit=5&lang=en_us" 
			# puts "Query itune with link: #{pod_lookup_link}"

			response = HTTParty.get(pod_lookup_link, format: :plain)
			json_response = JSON.parse response, symbolize_names: true

			# puts json_response.class #hash
			num_of_results = json_response[:resultCount]
			# puts num_of_results
			results = json_response[:results]

			# puts results

			# puts results.class #array
			@actual_data = results[0]
			puts @actual_data

			# puts "The above block is a...."
			# puts @actual_data.class
			# @podcast = Podcast.new
			@podcast = {:name => @actual_data[:collectionName], :host => @actual_data[:artistName], :feed => @actual_data[:feedUrl], :image_url => @actual_data[:artworkUrl60] }

			puts "========="
			puts @podcast[:artworkUrl60]
			puts @podcast

			# artist_name = @actual_data[:artistName]
			# puts artist_name
		else
			
		end
	end

	# def catch
	# 	if params[:lookup]
	# 		@lookup = params[:lookup].strip
	# 		it_lookup = @lookup.gsub(/\s+/, "+")
	# 		puts "Searching for: #{it_lookup}"
	# 		pod_lookup_link = "https://itunes.apple.com/search?attribute=titleTerm&entity=podcast&media=podcast&term=#{it_lookup}&limit=5&lang=en_us" 
	# 		puts "Query itune with link: #{pod_lookup_link}"

	# 		response = HTTParty.get(pod_lookup_link, format: :plain)
	# 		json_response = JSON.parse response, symbolize_names: true

	# 		puts json_response.class #hash
	# 		results = json_response[:results]

	# 		puts results

	# 		puts results.class #array
	# 		@actual_data = results[0]
	# 		puts @actual_data

	# 		puts "The above block is a...."
	# 		puts @actual_data.class

	# 		artist_name = @actual_data[:artistName]
	# 		puts artist_name
			
	# 		redirect_to catch_path(@actual_data)
	# 	else
	# 		render 'catch'
	# 	end


	# 	# redirect_to new_podcast_path
	# 	# render html: 'We have caugth the serach term'.html_safe
	# end
	def results

	end
end