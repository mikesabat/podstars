class Podcast < ApplicationRecord
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	#to resize images with paperclip -- has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	#and then <%= image_tag @article.image.url(:medium) %>
	#from http://tutorials.jumpstartlab.com/projects/blogger.html
end
