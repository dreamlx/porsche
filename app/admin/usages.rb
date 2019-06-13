ActiveAdmin.register Usage do
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
menu priority: 1

permit_params :title, :order_date,
	order_items_attributes: [:id, :order_no, :product_id, :product, :quantity]

	index do 
		column :id
		column :order_no
		column :order_date
		column :title
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

		panel 'usage detail' do
			table_for usage.order_items do
				column :id
				column :product
				column :quantity
			end
		end
		active_admin_comments
	end

	form do |f|
		f.semantic_errors # shows errors on :base
  	f.inputs do
  		#f.input :order_no, input_html: { value: Date.today }
  		f.input :order_date, as: :datepicker, hint: 'Usage date', input_html: { value: Date.today }
  		f.input :title, hint: 'order memo'
  		
  	end

  	f.inputs 'Tire or Part' do
  		f.has_many :order_items, new_record: 'add record', allow_destory: -> (c) { c.author?(current_admin_user) } do |o|
  			o.input :product, collection: Product.all.map{|t| [ "#{t.code} - #{t.category} - #{t.specification}", t.id,]}
  			o.input :quantity
  			
  		end
  	end

  	# f.inputs 'Part' do
  	# 	f.has_many :order_items, new_record: 'add record', allow_destory: -> (c) { c.author?(current_admin_user) } do |o|
  	# 		o.input :product, collection: Part.all.map{|t| [ "#{t.code} - #{t.category} - #{t.specification}", t.id,]}
  	# 		o.input :quantity
  			
  	# 	end
  	# end

  	f.actions
	end
end