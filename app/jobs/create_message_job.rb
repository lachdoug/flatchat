class CreateMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'events_channel', {event: :new_message, message: message.as_json }
  end

end
