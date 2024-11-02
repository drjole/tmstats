class User < ApplicationRecord
  has_many :sessions, dependent: :destroy

  has_many :players
  has_many :games, through: :players

  scope :ranked, -> { where(ranked: true) }

  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_secure_password

  has_one_attached :profile_picture

  def elo
    return nil unless ranked?

    players.last.elo if players.any?
  end
end
