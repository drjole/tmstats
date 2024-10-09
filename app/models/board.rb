class Board < ApplicationRecord
  belongs_to :extension

  validates :name, presence: true, uniqueness: true
end
