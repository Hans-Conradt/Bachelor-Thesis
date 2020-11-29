class AddTimestampToMpoState < ActiveRecord::Migration[6.0]
  def change
    add_column :mpo_states, :timestamp, :time
  end
end
