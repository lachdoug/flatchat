class Room < ApplicationRecord

  has_many :messages, dependent: :destroy
  belongs_to :user

  validates :name, uniqueness: true, length: { minimum: 4, maximum: 24 }

  def as_json(opts=nil)
    { id: id,
      user: user.username,
      name: name,
      created_at: created_at,
      messages: messages.as_json }
  end

end
