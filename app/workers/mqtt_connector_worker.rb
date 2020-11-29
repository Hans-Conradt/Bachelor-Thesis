# frozen_string_literal: true

# This Worker connects to the MQTT client of the smart factory and handles
# the incoming data stream.
class MqttConnectorWorker
  include Sidekiq::Worker
  require 'mqtt'
  require 'json'

  def perform
    connect_to_client
    subscribe_to_topics
    @client.get do |topic, message|
      process_message(topic, message)
    end
    @client
  end

  def connect_to_client
    @client = MQTT::Client.connect(
      host: 'smartfactory.ics.unisg.ch',
      port: 1883,
      username: 'txt',
      password: 'xtx'
    )
  end

  def subscribe_to_topics
    @client.subscribe(
      'i/bme680', # Environment Sensor
      'i/ldr', # Brightness Sensor
      'i/cam', # Camera Picture
      'i/ptu/pos', # Pos Pan-Tilt-Unit
      'i/alert', # Alert Message
      'i/broadcast', # Broadcast
      'f/i/state/hbw', # State HBW
      'f/i/state/vgr', # State VGR
      'f/i/state/mpo', # State MPO
      'f/i/state/sld', # State SLD
      'f/i/state/dsi', # State DSI (VGR)
      'f/i/state/dso', # State DSO (VGR)
      'f/i/stock', # Stock HBW
      'f/i/order', # State Order(VGR)
      'f/i/nfc/ds' # State NFC Device (VGR)
    )
  end

  def process_message(topic, message)
    case topic
    when 'i/bme680'
      update_environment(message)
    when 'i/ldr'
      update_brightness(message)
    when 'i/cam'
      update_image(message)
    # when 'i/ptu/pos'
    #   update_ptu_pos(message)
    # when 'i/alert'
    #   update_alert(message)
    # when 'i/broadcast'
    #   update_broadcast(message)
    when 'f/i/state/hbw'
      update_hbw_state(message)
    when 'f/i/state/vgr'
      update_vgr_state(message)
    when 'f/i/state/mpo'
      update_mpo_state(message)
    when 'f/i/state/sld'
      update_sld_state(message)
    when 'f/i/state/dsi'
      update_dsi_state(message)
    when 'f/i/state/dso'
      update_dso_state(message)
    when 'f/i/stock'
      update_stock(message)
    # when 'f/i/order'
    #   update_order(message)
    # when 'f/i/nfc/ds'
    #   update_nfc_ds(message)
    end
  end

  def update_environment(message)
    environment_hash = JSON.parse(message)
    new_environment = {
      timestamp: environment_hash['ts'],
      temperature: environment_hash['t'],
      airquality: environment_hash['iaq'],
      aqs: environment_hash['aq'],
      humidity: environment_hash['h'],
      airpressure: environment_hash['p']
    }
    EnvironmentSensor.new(new_environment).save!
    puts 'Environment Updated'
  end

  def update_brightness(message)
    brightness_hash = JSON.parse(message)
    new_brightness = {
      timestamp: brightness_hash['ts'],
      brightness: brightness_hash['br'],
      ldr: brightness_hash['ldr']
    }
    BrightnessSensor.new(new_brightness).save!
    puts 'Brigtness Updated'
  end

  def update_image(message)
    image_json = JSON.parse(message)
    data = image_json.first[1].sub!('data:image/jpeg;base64,', '')
    File.open('app/assets/images/station_image.jpeg', 'wb') do |file|
      file.write(Base64.decode64(data))
    end
    puts 'Image Updated'
  end

  def update_hbw_state(message)
    hbw_json = JSON.parse(message)
    new_hbw_state = HbwState.new(active: hbw_json['active'].to_i)
    new_hbw_state.save
    puts 'HBW State Updated'
  end

  def update_vgr_state(message)
    vgr_json = JSON.parse(message)
    new_vgr_state = VgrState.new(active: vgr_json['active'].to_i, target: vgr_json['target'])
    new_vgr_state.save
    puts 'VGR State Updated'
  end

  def update_mpo_state(message)
    mpo_json = JSON.parse(message)
    new_mpo_state = MpoState.new(active: mpo_json['active'].to_i)
    new_mpo_state.save
    puts 'MPO State Updated'
  end

  def update_sld_state(message)
    sld_json = JSON.parse(message)
    new_sld_state = SldState.new(active: sld_json['active'].to_i)
    new_sld_state.save
    puts 'SLD State Updated'
  end

  def update_dsi_state(message)
    dsi_json = JSON.parse(message)
    new_dsi_state = DsiState.new(active: dsi_json['active'].to_i)
    new_dsi_state.save
    puts 'DSI State Updated'
  end

  def update_dso_state(message)
    dso_json = JSON.parse(message)
    new_dso_state = DsoState.new(active: dso_json['active'].to_i)
    new_dso_state.save
    puts 'DSO State Updated'
  end

  def update_stock(message)
    stock_hash = JSON.parse(message)
    modified_stock_hash = stock_hash['stockItems'].map do |slot|
      slot.transform_values do |value|
        if value == nil
          {
            'id' => 'NIL',
            'state' => 'Vacant',
            'type' => 'NIL'
          }
        else
          value
        end
      end
    end
    Stock.new(stockitems: modified_stock_hash).save!
    puts 'Stock Updated'
  end
end


