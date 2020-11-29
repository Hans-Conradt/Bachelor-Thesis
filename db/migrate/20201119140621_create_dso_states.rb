class CreateDsoStates < ActiveRecord::Migration[6.0]
  def change
    create_table :dso_states do |t|
      t.integer :active

      t.timestamps
    end
  end
end
