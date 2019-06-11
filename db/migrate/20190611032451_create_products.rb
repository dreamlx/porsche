class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :code
      t.string :title
      t.string :type
      t.string :category
      t.string :specification
      t.string :brand
      t.string :pattern
      t.string :vehicle_type
      t.text :memo
      t.string :status
    end
  end
end
