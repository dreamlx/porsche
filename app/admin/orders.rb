ActiveAdmin.register Order do
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

index do
	column :id
	column :type

	actions
end

	show do
		attributes_table do
			row :type
			row :id
			row :order_no
			row :title
			row :order_date


		end

		panel 'order detail' do
			table_for order.order_items do
				column :id
				column :product
				column :quantity
			end
		end
		active_admin_comments
	end

end
