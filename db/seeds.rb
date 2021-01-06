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
  role: 'admin'
}, {
  email: 'production@example.com',
  first_name: 'Production',
  last_name: 'Example',
  password: 'Production0022',
  role: 'production'
}, {
  email: 'business@example.com',
  first_name: 'Business',
  last_name: 'Example',
  password: 'Business0022',
  role: 'business'
}, {
  email: 'process@example.com',
  first_name: 'Process',
  last_name: 'Example',
  password: 'Process0022',
  role: 'process'
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
  active: 0,
  created_at: '2020-10-20 10:00:11.249523'
}]
hbwstates.each { |hbwstate| HbwState.new(hbwstate).save! }

puts 'Cleaning DsoStates...'
DsoState.destroy_all
puts 'Creating DsoStates...'

dsostates = [{
  active: 0,
  created_at: '2020-10-20 10:00:11.249523'
}]
dsostates.each { |dsostate| DsoState.new(dsostate).save! }

puts 'Cleaning DsiStates...'
DsiState.destroy_all
puts 'Creating DsiStates...'

dsistates = [{
  active: 0,
  created_at: '2020-10-20 10:00:11.249523'
}]
dsistates.each { |dsistate| DsiState.new(dsistate).save! }

puts 'Cleaning VgrStates...'
VgrState.destroy_all
puts 'Creating VgrStates...'

vgrstates = [{
  active: 0,
  created_at: '2020-10-20 10:00:11.249523'
}]
vgrstates.each { |vgrstate| VgrState.new(vgrstate).save! }

puts 'Cleaning SldStates...'
SldState.destroy_all
puts 'Creating SldStates...'

sldstates = [{
  active: 0,
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


# puts 'Cleaning Stock...'
# Stock.destroy_all
# puts 'Creating Stock...'

# message = "[{\'location\'=>\'A1\', \'workpiece\'=>{\'id\'=>\'NIL\', \'state\'=>\'Vacant\', \'type\'=>\'NIL\'}}, {\'location\'=>\'A2\', \'workpiece\'=>{\'id\'=>\'NIL\', \'state\'=>\'Vacant\', \'type\'=>\'NIL\'}}, {\'location\'=>\'A3\', \'workpiece\'=>{\'id\'=>\'NIL\', \'state\'=>\'Vacant\', \'type\'=>\'NIL\'}}, {\'location\'=>\'B1\', \'workpiece\'=>{\'id\'=>\'0417ae4a616080\', \'state\'=>\'RAW\', \'type\'=>\'BLUE\'}}, {\'location\'=>\'B2\', \'workpiece\'=>{\'id\'=>\'NIL\', \'state\'=>\'Vacant\', \'type\'=>\'NIL\'}}, {\'location\'=>\'B3\', \'workpiece\'=>{\'id\'=>\'NIL\', \'state\'=>\'Vacant\', \'type\'=>\'NIL\'}}, {\'location\'=>\'C1\', \'workpiece\'=>{\'id\'=>\'04b4ae4a616080\', \'state\'=>\'RAW\', \'type\'=>\'BLUE\'}}, {\'location\'=>\'C2\', \'workpiece\'=>{\'id\'=>\'NIL\', \'state\'=>\'Vacant\', \'type\'=>\'NIL\'}}, {\'location\'=>\'C3\', \'workpiece\'=>{\'id\'=>\'NIL\', \'state\'=>\'Vacant\', \'type\'=>\'NIL\'}}]"
# stock_hash = JSON.parse(message)
# Stock.new(stockitems: stock_hash).save!

puts 'Cleaning Orders...'
Order.destroy_all
puts 'Creating Orders..'

states = ['SHIPPED', 'IN_PROGRESS', 'WAITING_FOR_ORDER', 'ORDERED']
dates = ['2020-01', '2020-02', '2020-03', '2020-04', '2020-05', '2020-06', '2020-07', '2020-08', '2020-09', '2020-10', '2020-11', '2020-12', '2021-01']
types = ['WHITE', 'RED', 'BLUE']
orders = []

def bernoulli(percentage)
  rand < percentage ? 1 : 0
end

1000.times do
  order = {
    state: states.sample,
    t: types.sample,
    time: "#{dates.sample}-24 10:00:11.249523",
    quality: bernoulli(0.8)
  }
  orders << order
end

orders.each { |order| Order.new(order).save! }

puts 'Cleaning OrderTargets...'
OrderTarget.destroy_all
puts 'Creating OrderTargets..'

quantities = [3, 5, 14, 4, 6, 8, 13, 10, 9, 1, 23, 4, 6, 9, 12, 8]
order_targets = []

dates.each do |date|
  order_target = {
    quantity: quantities.sample,
    t: types.sample,
    time: "#{date}-24 10:00:11.249523"
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
end

puts 'Cleaning Workpieces...'
Workpiece.destroy_all
puts 'Creating Workpieces...'

workpieces = [{
  history: 'NIL',
  code100: 'NIL',
  code200: 'NIL',
  code800: 'NIL',
  state: 'RAW',
  color: 'BLUE',
  workpiece_id: '0417ae4a616080'
}, {
  history: 'NIL',
  code100: 'NIL',
  code200: 'NIL',
  code800: 'NIL',
  state: 'RAW',
  color: 'BLUE',
  workpiece_id: '04b4ae4a616080'
}, {
  history: 'NIL',
  code100: '2020-02-26T10:56:46.959Z',
  code200: '2020-02-26T10:56:46.959Z',
  code800: '2020-02-26T10:56:46.959Z',
  state: 'PROCESSED',
  color: 'WHITE',
  workpiece_id: '04b6ae4a616080'
}, {
  history: 'NIL',
  code100: '2020-02-26T10:56:46.959Z',
  code200: '2020-02-26T10:56:46.959Z',
  code800: '2020-02-26T10:56:46.959Z',
  state: 'PROCESSED',
  color: 'RED',
  workpiece_id: '0426ae4a616080'
}, {
  history: 'NIL',
  code100: '2020-02-26T10:56:46.959Z',
  code200: '2020-02-26T10:56:46.959Z',
  code800: '2020-02-26T10:56:46.959Z',
  state: 'PROCESSED',
  color: 'BLUE',
  workpiece_id: '04f6ae4a616080'
}, {
  history: 'NIL',
  code100: '2020-02-26T10:56:46.959Z',
  code200: '2020-02-26T10:56:46.959Z',
  code800: '2020-02-26T10:56:46.959Z',
  state: 'PROCESSED',
  color: 'WHITE',
  workpiece_id: '0t76ae4a616080'
}, {
  history: 'NIL',
  code100: '2020-02-26T10:56:46.959Z',
  code200: '2020-02-26T10:56:46.959Z',
  code800: '2020-02-26T10:56:46.959Z',
  state: 'PROCESSED',
  color: 'RED',
  workpiece_id: '04d6ae4a616080'
}, {
  history: 'NIL',
  code100: '2020-02-26T10:56:46.959Z',
  code200: '2020-02-26T10:56:46.959Z',
  code800: '2020-02-26T10:56:46.959Z',
  state: 'PROCESSED',
  color: 'BLUE',
  workpiece_id: '04f4ae4a616080'
}]

workpieces.each do |workpiece|
  Workpiece.new(workpiece).save!
end
