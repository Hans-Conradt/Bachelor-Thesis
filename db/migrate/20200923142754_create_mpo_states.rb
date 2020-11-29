class CreateMpoStates < ActiveRecord::Migration[6.0]
  def change
    create_table :mpo_states do |t|
      t.integer :active
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
