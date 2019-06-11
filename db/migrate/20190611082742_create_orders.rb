class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_no
      t.string :type
      t.date :order_date
      t.string :title
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
