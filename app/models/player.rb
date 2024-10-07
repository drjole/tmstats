class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :corporation

  validates :victory_points, presence: true, numericality: {greater_than: 0}
end
