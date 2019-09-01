class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :grand_total
      t.float :discount

      t.timestamps
    end
  end
end
