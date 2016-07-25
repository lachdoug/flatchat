class CreateRoomJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast 'events_channel', {event: :new_room, room: room.as_json}
    ActionCable.server.broadcast 'server_updates_channel', {event: :new_room, room: room_html(room) }
  end

  private

  def room_html(room)
    ApplicationController.renderer.render(partial: 'rooms/room', locals: {room: room})
  end

end
