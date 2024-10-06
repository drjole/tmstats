class Game < ApplicationRecord
  has_many :extensions
  has_many :players
end
