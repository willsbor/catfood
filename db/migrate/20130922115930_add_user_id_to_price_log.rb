class AddUserIdToPriceLog < ActiveRecord::Migration
  def change
    add_column :price_logs, :user_id, :integer
    add_index :price_logs, :user_id
  end
end
