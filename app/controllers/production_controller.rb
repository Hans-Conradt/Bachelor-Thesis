# frozen_string_literal: true

# This controller handles the ruby logic for the manager dashboard
class ProductionController < ApplicationController
  def index
    equipment_effectiveness
    track_workpieces
    @good_orders = Order.where(quality: 1)
    @bad_orders = Order.where(quality: 0)
  end

  def equipment_effectiveness
    quality = Order.where(quality: 1).count / Order.all.count.to_f
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
end
