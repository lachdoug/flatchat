class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
    # , :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :workshop_key

  validates :username, length: {minimum: 5, maximum: 12}, uniqueness: true
  validates :password, length: {minimum: 6}, confirmation: true
  validate :workshop_key_is_correct

  # Assign an API key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end

  def workshop_key_is_correct
    errors.add :workshop_key, 'is incorrect' unless username == 'admin' || Rails.application.config.workshop_key == self.workshop_key
  end

  def is_admin?
    username == 'admin'
  end

end
