class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float   :subtotal,      null: false, default: 0.0
      t.float   :grand_total,   null: false, default: 0.0
      t.string  :status,        null: false, default: "open"

      t.timestamps
    end
  end
end
