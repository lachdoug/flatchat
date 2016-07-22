class CreateRoomJob < ApplicationJob
  queue_as :default

  def perform(room)
    ActionCable.server.broadcast 'events_channel', {event: :new_room, room: room.as_json}
  end

end
