# frozen_string_literal: true

# This file seeds the database with its default values.
# The data can then be loaded with the rails db:seed command

puts 'Cleaning Users...'
User.destroy_all
puts 'Creating user...'

users = [{
  email: 'admin@example.com',
  first_name: 'Admin',
  last_name: 'Example',
  password: 'Admin0022',
  position: 'admin'
}, {
  email: 'manager@example.com',
  first_name: 'Manager',
  last_name: 'Example',
  password: 'Manager0022',
  position: 'manager'
}, {
  email: 'exective@example.com',
  first_name: 'Executive',
  last_name: 'Example',
  password: 'Executive0022',
  position: 'executive'
}, {
  email: 'operations_staff@example.com',
  first_name: 'Operations_staff',
  last_name: 'Example',
  password: 'Operations_staff0022',
  position: 'operations_staff'
}]

users.each { |user| User.new(user).save! }

puts 'Cleaning MpoStates...'
MpoState.destroy_all
puts 'Creating MpoStates...'

mpostates = [{
  active: 0,
  created_at: '2020-10-24 10:30:11.249523'
}]
mpostates.each { |mpostate| MpoState.new(mpostate).save! }

puts 'Cleaning HbwStates...'
HbwState.destroy_all
puts 'Creating HbwStates...'

hbwstates = [{
  active: 1,
  created_at: '2020-10-20 10:00:11.249523'
}]
hbwstates.each { |hbwstate| HbwState.new(hbwstate).save! }

puts 'Cleaning DsoStates...'
DsoState.destroy_all
puts 'Creating DsoStates...'

dsostates = [{
  active: 1,
  created_at: '2020-10-20 10:00:11.249523'
}]
dsostates.each { |dsostate| DsoState.new(dsostate).save! }

puts 'Cleaning DsiStates...'
DsiState.destroy_all
puts 'Creating DsiStates...'

dsistates = [{
  active: 1,
  created_at: '2020-10-20 10:00:11.249523'
}]
dsistates.each { |dsistate| DsiState.new(dsistate).save! }

puts 'Cleaning VgrStates...'
VgrState.destroy_all
puts 'Creating VgrStates...'

vgrstates = [{
  active: 1,
  created_at: '2020-10-20 10:00:11.249523'
}]
vgrstates.each { |vgrstate| VgrState.new(vgrstate).save! }

puts 'Cleaning SldStates...'
SldState.destroy_all
puts 'Creating SldStates...'

sldstates = [{
  active: 1,
  created_at: '2020-10-20 10:00:11.249523'
}]
sldstates.each { |sldstate| SldState.new(sldstate).save! }

puts 'Cleaning Environment Sensor data...'
EnvironmentSensor.destroy_all
puts 'Creating Environment Sensor data...'

environments = [{
  timestamp: '2020-10-24 10:00:11.249523',
  temperature: 25.1,
  airquality: 200,
  aqs: 3,
  humidity: 40.0,
  airpressure: 1000.15
}]
environments.each { |environment| EnvironmentSensor.new(environment).save! }

puts 'Cleaning Brightness Sensor data...'
BrightnessSensor.destroy_all
puts 'Creating Brightness Sensor data...'

brightnesses = [{
  timestamp: '2020-10-24 10:00:11.249523',
  brightness: 96.6,
  ldr: 12_400
}]
brightnesses.each { |brightness| BrightnessSensor.new(brightness).save! }


puts 'Cleaning Stock...'
Stock.destroy_all
puts 'Creating Stock...'

message = '{"stockItems": [{"location": "A1", "workpiece": {"id": "NIL", "state": "Vacant", "type": "NIL"}}, {"location": "A2", "workpiece": {"id": "04b4ae4a616080", "state": "RAW", "type": "BLUE"}}, {"location": "A3", "workpiece": {"id": "042eac4a616080", "state": "RAW", "type": "RED"}}, {"location": "B1", "workpiece": {"id": "042fac4a616080", "state": "RAW", "type": "RED"}}, {"location": "B2", "workpiece": {"id": "0423ab4a616080", "state": "RAW", "type": "RED"}}, {"location": "B3", "workpiece": {"id": "04f2b74a616080", "state": "RAW", "type": "WHITE"}}, {"location": "C1", "workpiece": {"id": "NIL", "state": "Vacant", "type": "NIL"}}, {"location": "C2", "workpiece": {"id": "0417ae4a616080", "state": "RAW", "type": "BLUE"}}, {"location": "C3", "workpiece": {"id": "NIL", "state": "Vacant", "type": "NIL"}}], "ts": "2020-02-26T10:23:44.012Z"}'
stock_hash = JSON.parse(message)
Stock.new(stockitems: stock_hash).save!

puts 'Cleaning Orders...'
Order.destroy_all
puts 'Creating Orders..'

states = ['SHIPPED', 'IN_PROGRESS', 'WAITING_FOR_ORDER', 'ORDERED']
dates = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
types = ['WHITE', 'RED', 'BLUE']
orders = []

100.times do
  order = {
    state: states.sample,
    t: types.sample,
    time: "2020-#{dates.sample}-24 10:00:11.249523"
  }
  orders << order
end

orders.each { |order| Order.new(order).save! }

puts 'Cleaning OrderTargets...'
OrderTarget.destroy_all
puts 'Creating OrderTargets..'

quantities = [3, 5, 14, 4, 6, 8, 13, 10, 9, 1, 23, 4, 6, 9, 12, 8]
dates = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
types = ['WHITE', 'RED', 'BLUE']
order_targets = []

100.times do
  order_target = {
    quantity: quantities.sample,
    t: types.sample,
    time: "2020-#{dates.sample}-24 10:00:11.249523"
  }
  order_targets << order_target
end

order_targets.each { |order_target| OrderTarget.new(order_target).save! }


puts 'Cleaning Camera Position data...'
CameraPosition.destroy_all
puts 'Creating Camera Position data...'

camera_positions= [{
  tilt: -0.3,
  pan: 0.3
}]
camera_positions.each { |position| CameraPosition.new(position).save! }


puts 'Cleaning Alerts...'
Alert.destroy_all
puts 'Creating Alerts...'

alerts = [{
  station: 'Camera',
  code: 100,
  }, {
  station: 'Environment Sensor',
  code: 200,
  }, {
  station: 'Environemnt Sensor',
  code: 300,
  }]
alerts.each do |alert|
  Alert.new(alert).save!
  sleep(100)
end
