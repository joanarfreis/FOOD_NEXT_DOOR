class AddSkuToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :sku, :string
  end
end
