class Game < ApplicationRecord
  belongs_to :board

  has_and_belongs_to_many :extensions # standard:disable Rails/HasAndBelongsToMany

  has_many :players, -> { order(:rank) }, dependent: :delete_all
  has_many :users, through: :players

  validates :date, presence: true
  validates :num_generations, numericality: {greater_than: 0, allow_nil: true}

  default_scope -> { order(date: :asc).order(id: :asc) }
  scope :ranked, -> { joins(:users).group("games.id").having("COUNT(users.id) = COUNT(CASE WHEN users.ranked = true THEN 1 END)") }

  accepts_nested_attributes_for :players, reject_if: :all_blank

  after_commit do
    # Trigger elo re-calculation
    if self == Game.last
      users.touch_all
    else
      User.all.touch_all
    end
  end

  def ranked?
    users.all?(&:ranked?)
  end
end
