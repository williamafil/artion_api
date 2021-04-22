class BidChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "bid_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def speak(data)
    # ActionCable.server.broadcast 'bid_channel', message: data['message']
  # end
end
