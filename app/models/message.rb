class Message < ApplicationRecord

  belongs_to :room
  belongs_to :user

  after_create_commit :send_new_room_updates

  def as_json(opts=nil)
    { id: id,
      room_id: room.id,
      user: user.username,
      body: body,
      created_at: created_at }
  end

  def send_new_room_updates
    CreateMessageJob.perform_later(self)

    # ActionCable.server.broadcast 'events_channel', {event: :new_message, message: to_json }
  end

end
