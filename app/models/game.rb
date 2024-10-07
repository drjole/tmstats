class Game < ApplicationRecord
  has_many :extensions
  has_many :players, dependent: :delete_all
  belongs_to :board

  accepts_nested_attributes_for :players, reject_if: :all_blank
end
