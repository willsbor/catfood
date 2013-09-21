class CreatePriceLogs < ActiveRecord::Migration
  def change
    create_table :price_logs do |t|
      t.integer :price
      t.date :log_date
      t.text :location
      t.float :capacity
      t.string :cap_unit
      t.integer :product_info_id

      t.timestamps
    end
  end
end
