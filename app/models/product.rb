class Product < ApplicationRecord
	has_many :order_items
	has_many :stocks, dependent: :destroy

	def title
		"#{self.code} - #{self.category} - #{self.specification}"
	end

	def last_stock
		if self.stocks.last.nil?
			last_stock = Stock.new(usage_num: 0, stock_num: 0, order_num: 0)
		else
			last_stock = self.stocks.last
		end
	end
end
