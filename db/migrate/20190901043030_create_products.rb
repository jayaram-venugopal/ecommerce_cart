class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,           null: false, default: ""
      t.float :price,           null: false, default: 0.0
      t.integer :quantity,      null: false, default: 0

      t.timestamps
    end

    add_index :products, :name,                unique: true
  end
end
