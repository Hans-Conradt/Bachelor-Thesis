class CreateDsiStates < ActiveRecord::Migration[6.0]
  def change
    create_table :dsi_states do |t|
      t.integer :active

      t.timestamps
    end
  end
end
