class AddPositionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :position, :string
  end
end
