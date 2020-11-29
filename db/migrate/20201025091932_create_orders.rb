class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.time :timestamp
      t.string :type

      t.timestamps
    end
  end
end
