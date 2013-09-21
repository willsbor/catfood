class CreateProductInfos < ActiveRecord::Migration
  def change
    create_table :product_infos do |t|
      t.string :vendor
      t.text :name
      t.integer :category_id

      t.timestamps
    end
  end
end
