class User < ApplicationRecord
	validates :name, presence: true
	validates :password, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :product_orders
	has_many :messages
end
