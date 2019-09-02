class AddAvilableQuantityForProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :avilable_quantity, :integer, :default => 0
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
