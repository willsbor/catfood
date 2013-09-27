class CreateCapacities < ActiveRecord::Migration
  def change
    create_table :capacities do |t|
      t.float :amount
      t.string :unit
      t.integer :sub_capacity

      t.timestamps
    end

    remove_column :price_logs, :capacity
    remove_column :price_logs, :cap_unit
    add_column :price_logs, :capacity_id, :integer
  end
end
