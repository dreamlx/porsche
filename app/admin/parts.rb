ActiveAdmin.register Part do
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
filter :code

	permit_params :code, :category, :specification, :memo

	index do 
		column :id
		column :code
		column :category
		column :specification
		actions
	end

	show do
		attributes_table do
			row :code
			row :category
			row :specification
			row :memo
		end
		active_admin_comments
	end
	form do |f|
		f.semantic_errors # shows errors on :base
  	f.inputs do
			f.input :code
			f.input :category, hint: 'parts', collection: [['brake pad（片）',  'brake pad（片）'], ['brake disc（盘）', 'brake disc（盘）'], ['Accessories(辅料)', 'Accessories(辅料)'], ['other', 'other']]
			f.input :specification
			f.input :memo
		end
		f.actions
	end
end
