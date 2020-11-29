class AddTToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :t, :string
  end
end
