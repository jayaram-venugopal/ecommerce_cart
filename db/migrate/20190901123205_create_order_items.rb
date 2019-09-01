class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :product,    foreign_key: true
      t.references :order,      foreign_key: true
      t.integer :quantity,      null: false, default: 0
      t.float :total,           null: false, default: 0.0
      t.float :discount,        null: false, default: 0.0

      t.timestamps
    end
  end
end
