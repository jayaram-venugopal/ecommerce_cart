class CreateCartDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_discounts do |t|
      t.float :discount_price,           null: false, default: 0.0
      t.float :grand_total,           null: false, default: 0.0

      t.timestamps
    end
  end
end
