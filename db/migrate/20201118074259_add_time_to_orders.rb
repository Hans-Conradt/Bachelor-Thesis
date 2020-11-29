class AddTimeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :time, :string
  end
end
