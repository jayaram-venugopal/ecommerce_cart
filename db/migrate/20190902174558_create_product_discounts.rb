class CreateProductDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_discounts do |t|
      t.references :product, foreign_key: true
      t.float :discount_price,           null: false, default: 0.0
      t.integer :no_of_products,         null: false, default: 0

      t.timestamps
    end
  end
end
