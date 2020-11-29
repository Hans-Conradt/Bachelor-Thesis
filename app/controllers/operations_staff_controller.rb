# frozen_string_literal: true

# This Controller handles the Operational Dashboards logic
class OperationsStaffController < ApplicationController
   before_action :authenticate_user!
  def index
    MqttConnectorWorker.perform_async
    current_stock?
    current_station_activity?
    last_alert?
  end

  def current_station_activity?
    @stations = [{
      name: 'HBW: High-Bay Warehouse',
      status: active?(HbwState).to_s,
      timestamp: HbwState.last.created_at
    }, {
      name: 'VGR: High-Bay Warehouse',
      status: active?(VgrState).to_s,
      timestamp: VgrState.last.created_at
    }, {
      name: 'MPO: Multi-Processing Station with Oven',
      status: active?(MpoState).to_s,
      timestamp: MpoState.last.created_at
    }, {
      name: 'SLD: Sorting Line with Color Detection',
      status: active?(SldState).to_s,
      timestamp: SldState.last.created_at
    }, {
      name: 'DSI Delivery',
      status: active?(DsiState).to_s,
      timestamp: DsiState.last.created_at
    }, {
      name: 'DSO Shipping',
      status: active?(DsoState).to_s,
      timestamp: DsoState.last.created_at
    }]
  end

  def active?(station)
    if station.last.active == 1
      'active'
    else
      'inactive'
    end
  end

  def last_alert?
    @alert_message = ''

    case Alert.last.code
    when 100
      @alert_message = 'Movement detected, check station image!'
    when 200
      @alert_message = 'Temperature < 4.0 °C'
    when 300
      @alert_message = 'Humidity > 80%'
    end
  end

  def current_stock?
    @current_stock = JSON.parse(Stock.last.stockitems.gsub('=>', ':'))["stockItems"]
    # @current_stock = eval(Stock.last.stockitems.gsub(':', '').gsub('=>', ':'))
  end
end
