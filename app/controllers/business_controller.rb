class BusinessController < ApplicationController
  before_action :authenticate_user!
  def index
    shipped_orders
    calculate_supply_chain_indicators
    calculate_financial_performance_indicators
    target_vs_actual
    calculate_order_forecast
  end

  def calculate_supply_chain_indicators
    @supply_chain_indicators = {
      product_availiability: (Workpiece.where(state: 'RAW').count / 9.0).round(2) * 100,
      perfect_order_rate: (@shipped_orders.where(quality: 1).count / @shipped_orders.all.count.to_f).round(2) * 100,
      on_time_delivery: 91.2,
      storage_costs: 10.1
    }
  end

  def calculate_financial_performance_indicators
    @financial_performance_indicators = {
      gross_profit_margin: 42,
      operating_expences: 34,
      net_profit_margin: 17
    }
  end

  def calculate_order_forecast # simple moving average looking at the last five periods
    relevant_months = [
      (Time.now - 1.month).strftime("%b"),
      (Time.now - 2.month).strftime("%b"),
      (Time.now - 3.month).strftime("%b"),
      (Time.now - 4.month).strftime("%b"),
      (Time.now - 5.month).strftime("%b")
    ]
    count = 0
    @shipped_orders.all.each do |order|
      count += 1 if relevant_months.include?(order.time.to_date.strftime("%b"))
    end
    @forecast = count / 5
    update_order_target
  end

  def update_order_target
    if OrderTarget.last.time.to_date.strftime("%b") == Time.now.strftime("%b")
      order = OrderTarget.last
      order.update(quantity: @forecast)
    else
      OrderTarget.new(quantity: @forecast, time: Time.now.to_s).save
    end
  end

  def target_vs_actual
    @target = {}
    @actual = {}

    OrderTarget.all.each do |target|
      @target.store("#{target.time.to_date.strftime("%b")}-#{target.time.to_date.strftime("%Y")}", target.quantity)
    end

    @shipped_orders.group(:time).count.each do |date, orders|
       @actual.store("#{date.to_date.strftime("%b")}-#{date.to_date.strftime("%Y")}", orders)
    end
  end
end
