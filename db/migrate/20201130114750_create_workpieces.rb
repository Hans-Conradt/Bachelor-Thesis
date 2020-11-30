class CreateWorkpieces < ActiveRecord::Migration[6.0]
  def change
    create_table :workpieces do |t|
      t.string :history
      t.string :code100
      t.string :code200
      t.string :code800
      t.string :state
      t.string :type
      t.string :workpiece_id

      t.timestamps
    end
  end
end
