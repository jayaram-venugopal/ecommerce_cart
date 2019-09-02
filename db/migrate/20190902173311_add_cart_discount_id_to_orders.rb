class AddCartDiscountIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cart_discount_id, :integer
  end
end
