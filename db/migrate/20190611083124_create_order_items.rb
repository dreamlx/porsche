class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.string :order_no
      t.belongs_to :order

      t.timestamps
    end
  end
end
