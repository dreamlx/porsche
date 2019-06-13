class OrderItem < ApplicationRecord
	belongs_to :product
	belongs_to :order
	has_one :stock

	before_save :set_quantity
	after_save :set_stock_record

	def order_type
		self.order.type
	end

	def product_type
		self.product.type
	end

	def order_date
		self.order.order_date
	end

  private
	def set_quantity
		self.quantity = self.quantity * -1 if self.order.type == 'Usage'
		self.order_no = self.order.order_no
	end

	def set_stock_record

			if self.product.stocks.last.nil? 
				last_stock = Stock.new(init_num: 0, order_num: 0, usage_num: 0, stock_num:0)
			else
				last_stock = self.product.stocks.last
			end
		

		
			self.stock = Stock.create!(init_num: 0, order_num: 0, usage_num: 0, stock_num:0, product_id: self.product.id, order_item_id: self.id) if self.stock.nil?
			stock = self.stock
			stock.order_num = self.quantity.to_i
			stock.stock_num = last_stock.stock_num + self.quantity
			stock.save
		
	end
end
