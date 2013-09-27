class CreateProductInfoLocationships < ActiveRecord::Migration
  def change
    create_table :product_info_locationships do |t|
      t.integer :product_info_id
      t.integer :location_id

      t.timestamps
    end

    remove_column :locations, :product_info_id
  end
end
