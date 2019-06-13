class CreateDepots < ActiveRecord::Migration[5.2]
  def change
    create_table :depots do |t|
      t.string :title
      t.string :code
      t.text :address
      t.text :memo
      t.string :status
      t.timestamps
      
    end
  end
end
