ActiveAdmin.register OrderItem do
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

	filter :order_type, as: :select, collection: ['Usage', 'Booking']
	filter :product_type, as: :select, collection: ['Tire', 'Part']
	filter :order_no
	
	menu parent: "Report"

	permit_params :id, :product_id, :quantity

	index do 
		column :id
		column :order_no do |o|
			link_to o.order.order_no, admin_order_path(o.order)
		end
		column :order_date
		column :product
		column :product_type do |o|
			o.product.type
		end
		column :order_type do |o|
			o.order.type
		end
		column :quantity

		div :class => "panel" do
      h3 "Sum quantity: #{OrderItem.search(params[:q]).result.sum(:quantity)}"
    end
	end

end
