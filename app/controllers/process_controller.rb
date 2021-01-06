# frozen_string_literal: true

# This Controller handles the Operational Dashboards logic
class ProcessController < ApplicationController
   before_action :authenticate_user!
  def index
    MqttConnectorWorker.perform_async
    current_station_activity?
    last_alert?
    maintainance_schedule
    camera_position?
    environment_data?
    current_process?
  end

  def last_alert?
    @alert_message = ''
    @alert_station = Alert.last.station
    case Alert.last.code
    when 100
      @alert_message = "Movement detected, check the station image!"
    when 200
      @alert_message = 'Temperature < 4.0 °C'
    when 300
      @alert_message = 'Humidity > 80%'
    end
  end

  def maintainance_schedule
    @active_stations = []
    @clear_for_maintainance = false

    current_station_activity?
    @stations.each do |station|
      @active_stations << station[:name] if station[:status] == 'active'
    end
    @clear_for_maintainance = true if @active_stations.empty?
  end

  def camera_position?
    @tilt = CameraPosition.last.tilt
    @pan = CameraPosition.last.pan
  end

  def environment_data?
    @temperature = EnvironmentSensor.last.temperature
    @air_preassure = EnvironmentSensor.last.airpressure
    @air_quality = EnvironmentSensor.last.airquality
    @humidity = EnvironmentSensor.last.humidity
    @brightness = BrightnessSensor.last.brightness
  end

  def current_process?
    if Order.last.state == "SHIPPED"
      @current_order = "No order in progress"
      @activity = 'inactive'
    else
      @current_order = "#{Order.last.state}"
      @activity = 'active'
    end
  end
end
