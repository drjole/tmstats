class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :corporation, optional: true

  validates :victory_points, numericality: {greater_than: 0}
end
