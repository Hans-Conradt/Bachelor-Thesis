class ApplicationController < ActionController::Base
  def active?(station)
    if station.last.active == 1
      'active'
    else
      'inactive'
    end
  end

  def shipped_orders
    @shipped_orders = Order.where(state: "SHIPPED")
  end

  def current_station_activity?
    @stations = [{
      name: 'HBW: High-Bay Warehouse',
      status: active?(HbwState).to_s,
      timestamp: HbwState.last.created_at
    }, {
      name: 'VGR: Vacuum Gripper',
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
      name: 'DSI: Delivery',
      status: active?(DsiState).to_s,
      timestamp: DsiState.last.created_at
    }, {
      name: 'DSO: Shipping',
      status: active?(DsoState).to_s,
      timestamp: DsoState.last.created_at
    }]
  end
end
