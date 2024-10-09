class Game < ApplicationRecord
  belongs_to :board

  has_and_belongs_to_many :extensions # standard:disable Rails/HasAndBelongsToMany
  has_many :players, dependent: :delete_all

  has_many :users, through: :players

  accepts_nested_attributes_for :players, reject_if: :all_blank

  validates :date, presence: true
  validates :num_generations, numericality: {greater_than: 0, allow_nil: true}
end
