class ProductOrder < ApplicationRecord
	belongs_to :user
	has_one :product
	has_many :messages
end
