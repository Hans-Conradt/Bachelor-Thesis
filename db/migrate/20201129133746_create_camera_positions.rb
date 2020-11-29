class CreateCameraPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :camera_positions do |t|
      t.float :pan
      t.float :tilt

      t.timestamps
    end
  end
end
