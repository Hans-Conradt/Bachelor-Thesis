class AddQualityToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :quality, :integer
  end
end
