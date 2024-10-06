class Game < ApplicationRecord
  has_many :extensions
  has_many :players
  belongs_to :board
end
