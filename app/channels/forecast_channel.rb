class ForecastChannel < ApplicationCable::Channel
  FORECAST_CHANNEL = 'forecast_channel'

  def subscribed
    stream_from FORECAST_CHANNEL
  end

  def unsubscribed
    stop_all_streams
  end

  def refresh
    index_partial = ApplicationController.render partial: 'home/index'
    ActionCable.server.broadcast FORECAST_CHANNEL, partial: index_partial
  end
end
