class CreateSldStates < ActiveRecord::Migration[6.0]
  def change
    create_table :sld_states do |t|
      t.integer :active
      t.time :timestamp

      t.timestamps
    end
  end
end
