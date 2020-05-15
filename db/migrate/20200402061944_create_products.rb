class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name, null: false
      t.string  :price, null: false
      t.string  :description, null: false
      t.string  :status, null: false
      t.string  :shipping_cost, null: false
      t.string  :shipping_days, null: false
      t.string  :prefecture_id, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.integer :destination_id, foreign_key: true
      # t.string  :judgment
      # t.integer :shipping_id, foreign_key: true
      t.integer :user_id,foreign_key: true
      t.timestamps
    end
  end
end
