class StationStatusChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "station_channel"
  end
end
