class CreateBrightnessSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :brightness_sensors do |t|
      t.time :timestamp
      t.float :brightness
      t.integer :ldr

      t.timestamps
    end
  end
end
