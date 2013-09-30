class ModifyCapacitySubId < ActiveRecord::Migration
  def change
    rename_column :capacities, :sub_capacity, :sub_capacity_id
  end
end
