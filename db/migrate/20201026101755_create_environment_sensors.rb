class CreateEnvironmentSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :environment_sensors do |t|
      t.time :timestamp
      t.float :temperature
      t.integer :airquality
      t.integer :aqs
      t.float :humidity
      t.float :airpressure

      t.timestamps
    end
  end
end
