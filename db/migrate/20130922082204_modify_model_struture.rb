class ModifyModelStruture < ActiveRecord::Migration
  def change
    add_column :users, :price_log_id, :integer
    add_index :users, :price_log_id
     
  end
end
