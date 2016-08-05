class CreateRoomJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast 'events_channel', {event: :new_room, room: room.to_json}
    p "-------------------- room created1"
    ActionCable.server.broadcast 'server_updates_channel', {event: :new_room, room: room_html(room) }
    p "-------------------- room created2"
  end

  private

  def room_html(room)
    ApplicationController.renderer.render(partial: 'rooms/room', locals: {room: room})
  end

end
