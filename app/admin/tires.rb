ActiveAdmin.register Tire do
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
menu parent: "Product"
filter :code
filter :category
filter :brand
filter :pattern


	permit_params :code, :category, :specification, :brand, :pattern, :vehicle_type, :memo

	index do 
		column :id
		#column :code
		column :category
		column :specification
		column :brand
		column :pattern
		column :vehicle_type
		column :order_num do |o|
			o.last_stock.order_num
		end
		column :usage_num do |o|
			o.last_stock.usage_num
		end
		column :stock_num do |o|
			o.last_stock.stock_num
		end
		actions
	end

	show do
		attributes_table do
			row :code
			row :category
			row :specification
			row :brand
			row :pattern
			row :vehicle_type
			row :memo
		end
		panel 'stock detail' do
			table_for part.stocks do
				column :created_at
				column :order_num
				column :usage_num
				column :stock_num
			end
		end

		active_admin_comments
	end
	form do |f|
		f.semantic_errors # shows errors on :base
  	f.inputs do
			f.input :code
			f.input :category, hint: 'Car Model', collection: [['Boxster/ Cayman',  'Boxster/ Cayman'], 
				['Carrera', 'Carrera'], ['GT3', 'GT3'],['Panamera','Panamera'], ['Macan','Macan'], ['Cayenne','Cayenne'], 
				['E3Cayenne E3','E3Cayenne E3'] ]
			f.input :specification
			f.input :brand, collection: ['Michelin Pilot Sport 4S', 'Michelin Pilot Alpin PA4', 'PIRELLI PZERO', 'Michelin ALPIN PA4', 'Michelin Pilot Sport CUP 2',
																	'Michelin Pilot Sport 4', 'Michelin Latitude Sport 3', 'Michelin  Latitude Sport' , 'Michelin  Pilot Sport A/S3']
			f.input :pattern, collection: ['N0', 'N1']
			f.input :vehicle_type, collection:['718', 'C2/C4/GTS/Turbo/TurboS', 'GT3', '911 GT3RS', 'Panamera 971 G2', 
																					'Macan S TURBO GTS', 'Macan', 'Cayenne E3']
			f.input :memo
		end
		f.actions
	end
end
