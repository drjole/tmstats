class User < ApplicationRecord
  has_many :sessions, dependent: :destroy

  has_many :players
  has_many :games, through: :players

  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_secure_password

  has_one_attached :profile_picture do |attachable|
    attachable.variant :profile, resize_to_limit: [200, 200]
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :tiny, resize_to_limit: [24, 24]
  end
end
