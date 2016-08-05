# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ServerUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "server_updates_channel"
  end

  # def speak(data)
  # end
end
