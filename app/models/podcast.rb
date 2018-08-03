class Podcast < ApplicationRecord
	require "open-uri"

	has_many :episodes
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates :name, uniqueness: true
	attr_reader :picture_from_url
	before_save :get_details
	
	def get_details #how do we call the name attribute in the before_save callback
		puts "+++++++++++++++++++++++++++ BEFORE_SAVE PODCAST CALLBACK"
		it_lookup = self.name.gsub(/\s+/, "+") 
		puts it_lookup #remove this
		pod_lookup_link = URI.encode("https://itunes.apple.com/search?attribute=titleTerm&entity=podcast&media=podcast&term=#{it_lookup}&limit=5&lang=en_us")

		response = HTTParty.get(pod_lookup_link, format: :plain)
		puts response.class
		puts response
		
		if response.parsed_response != nil
			json_response = JSON.parse response, symbolize_names: true
		
			#puts json_response

			num_of_results = json_response[:resultCount]
			results = json_response[:results]

			if num_of_results > 0
				@actual_data = results[0] 
				self.feed = @actual_data[:feedUrl]
				self.host = @actual_data[:artistName]
				self.image_url = @actual_data[:artworkUrl600]
				self.homepage = @actual_data[:collectionViewUrl]
			end
		else
			return
		end

		
		
	end
end