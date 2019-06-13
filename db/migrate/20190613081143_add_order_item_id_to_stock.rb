class AddOrderItemIdToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :order_item_id, :integer
  end
end
