class CreateVgrStates < ActiveRecord::Migration[6.0]
  def change
    create_table :vgr_states do |t|
      t.integer :active
      t.string :target
      t.time :timestamp

      t.timestamps
    end
  end
end
