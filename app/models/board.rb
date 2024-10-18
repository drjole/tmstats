class Board < ApplicationRecord
  belongs_to :extension

  has_many :games

  validates :name, presence: true, uniqueness: true
end
