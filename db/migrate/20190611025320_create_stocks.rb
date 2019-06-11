class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      
      t.integer :init_num
      t.integer :order_num
      t.integer :usage_num
      t.integer :stock_num
      t.text :memo

      t.belongs_to :stockable, :polymorphic => true
    end
  end
end
