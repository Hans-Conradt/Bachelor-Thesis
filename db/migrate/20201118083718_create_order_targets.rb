class CreateOrderTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :order_targets do |t|
      t.integer :quantity
      t.string :time
      t.string :type

      t.timestamps
    end
  end
end
