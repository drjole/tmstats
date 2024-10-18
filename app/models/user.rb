class User < ApplicationRecord
  has_many :sessions, dependent: :destroy

  has_many :players
  has_many :games, through: :players

  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_secure_password

  has_one_attached :profile_picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
