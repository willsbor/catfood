class AddAmountTotalToPriceLog < ActiveRecord::Migration
  def change
    add_column :price_logs, :amount, :integer
    add_column :price_logs, :total, :integer
  end
end
