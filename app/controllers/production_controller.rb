# frozen_string_literal: true

# This controller handles the ruby logic for the manager dashboard
class ProductionController < ApplicationController
  before_action :authenticate_user!
  def index
    shipped_orders
    equipment_effectiveness
    track_workpieces
    current_stock?
    last_order?
    current_order?
    @good_orders = @shipped_orders.where(quality: 1)
    @bad_orders = @shipped_orders.where(quality: 0)
  end

  def equipment_effectiveness
    quality = @shipped_orders.where(quality: 1).count / @shipped_orders.all.count.to_f
    # performance
    # availability
    @oee_hash = {
      availability: 0.2, # (factories activity / planned activity)
      performance: 0.7, # ( total orders / target)
      quality: quality # ( good orders / total orders)
    }
    @oee = ((@oee_hash[:availability] * @oee_hash[:performance] * @oee_hash[:quality])).round(2)
  end

  def track_workpieces
    @processed_workpieces = Workpiece.where(state: 'PROCESSED')
    @raw_workpieces = Workpiece.where(state: 'RAW')
  end

  def current_stock?
    @current_stock = JSON.parse(Stock.last.stockitems.gsub('=>', ':'))
  end

  def current_order?
    if Order.last.state == "SHIPPED"
      @current_order = "No order in progress"
      @activity = 'inactive'
    else
      @current_order = "#{Order.last.t} #{Order.last.state}"
      @activity = 'active'
    end
  end

  def last_order?
    @last_order = @shipped_orders.last.t # t = type
  end
end
