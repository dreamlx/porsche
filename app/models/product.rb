class Product < ApplicationRecord
	has_many :order_items
	def title
		"#{self.code} - #{self.category} - #{self.specification}"
	end
end
