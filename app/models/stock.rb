class Stock < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :product
  belongs_to :order_item

	def product_type
		self.product.type
	end

	def order_date
		self.order_item.order.order_date
	end

end
