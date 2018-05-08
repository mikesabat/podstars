class Episode < ApplicationRecord
	belongs_to :star
	validates :star, presence: true
	#validates :star, :podcast, presence: true ---- when we have the podcast model working.
	
end
