class Corporation < ApplicationRecord
  belongs_to :extension
  has_many :players
  has_many :games, through: :players

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(:name) }
end
