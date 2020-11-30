class RenameTypetoColor < ActiveRecord::Migration[6.0]
  def change
    rename_column :workpieces, :type, :color
  end
end
