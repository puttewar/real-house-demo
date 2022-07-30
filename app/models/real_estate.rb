class RealEstate < ApplicationRecord

	has_many_attached :images

	validates :address, :sqmt, :price, presence: true
end
