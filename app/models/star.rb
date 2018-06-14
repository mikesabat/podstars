class Star < ApplicationRecord
	has_many :episodes
	has_one :search_cache
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates :name, uniqueness: true
	before_save :make_cap

	def make_cap
		self.name = self.name.split.map(&:capitalize)*' '
	end
end
