class RenameOrderType < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :order_type, :type
  end
end
