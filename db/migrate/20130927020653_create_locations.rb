class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :product_info_id

      t.timestamps
    end

    remove_column :price_logs, :location
    add_column :price_logs, :location_id, :integer
  end
end
