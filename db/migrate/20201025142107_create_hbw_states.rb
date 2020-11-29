class CreateHbwStates < ActiveRecord::Migration[6.0]
  def change
    create_table :hbw_states do |t|
      t.integer :active
      t.time :timestamp

      t.timestamps
    end
  end
end
