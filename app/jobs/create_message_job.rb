class CreateMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'events_channel', {event: :new_message, message: message.to_json }
    p "-------------------- message created1"
    ActionCable.server.broadcast 'server_updates_channel', {event: :new_message, message: message_html(message) }
    p "-------------------- message created2"
  end

  private

  def message_html(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end

end
