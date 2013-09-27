class CreateProductInfoCapacityships < ActiveRecord::Migration
  def change
    create_table :product_info_capacityships do |t|
      t.integer :product_info_id
      t.integer :capacity_id

      t.timestamps
    end
  end
end
