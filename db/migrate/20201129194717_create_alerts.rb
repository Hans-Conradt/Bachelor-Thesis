class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.string :station
      t.string :data
      t.integer :code

      t.timestamps
    end
  end
end
