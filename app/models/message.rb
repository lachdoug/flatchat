class Message < ApplicationRecord

  belongs_to :room
  belongs_to :user

  def as_json(opts=nil)
    { id: id,
      room_id: room.id,
      user: user.username,
      body: body,
      created_at: created_at }
  end

end
