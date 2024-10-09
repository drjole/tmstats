class User < ApplicationRecord
  has_many :sessions, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_secure_password
end
