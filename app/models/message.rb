class Message < ApplicationRecord
	belongs_to :product_orders
	belongs_to :user
end
