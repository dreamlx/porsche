class Order < ApplicationRecord

	has_many :order_items
	accepts_nested_attributes_for :order_items
	after_save :generate_number


	private


  def generate_number
    update_attribute(:order_no, "%05d" % id) unless order_no
  end
end
