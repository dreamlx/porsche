ActiveAdmin.register Stock do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# 

	filter :product

	filter :product_type, as: :select, collection: ['Tire', 'Part']


	menu label: 'Stock Records'
	menu parent: "Other"
		belongs_to :product, :optional =>true

	index do
		column :id
		column :init_num
		column :order_num
		column :usage_num
		column :stock_num
		column :product
		column :Order do |s|
			link_to s.order_item.order.order_no, admin_order_path(s.order_item.order.id)
		end
		column :product_type do |o|
			o.product.type
		end

	end
end
