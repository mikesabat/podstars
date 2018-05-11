class Podcast < ApplicationRecord
	require "open-uri"

	has_many :episodes
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates :name, uniqueness: true
	attr_reader :picture_from_url
	
	# def picture_from_url(url)
	# 	self.image = URI.parse(url)
	# end
	
	#another attempt
	# def image_remote_url(url)
 #    	self.image = URI.parse(url)
 #    	# @podcast_remote_url = podcast_remote_url
 #  	end

	#to resize images with paperclip -- has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	#and then <%= image_tag @article.image.url(:medium) %>
	#from http://tutorials.jumpstartlab.com/projects/blogger.html
end
