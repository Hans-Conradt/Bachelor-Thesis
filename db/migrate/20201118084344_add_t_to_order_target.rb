class AddTToOrderTarget < ActiveRecord::Migration[6.0]
  def change
    add_column :order_targets, :t, :string
  end
end
