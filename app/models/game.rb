class Game < ApplicationRecord
  belongs_to :board

  has_and_belongs_to_many :extensions # standard:disable Rails/HasAndBelongsToMany

  has_many :players, -> { order(:rank) }, dependent: :delete_all
  has_many :users, through: :players

  validates :time, presence: true
  validates :num_generations, numericality: {greater_than: 0, allow_nil: true}

  default_scope -> { order(time: :asc) }
  scope :ranked, -> { joins(:users).group("games.id").having("COUNT(users.id) = COUNT(CASE WHEN users.ranked = true THEN 1 END)") }

  accepts_nested_attributes_for :players, reject_if: :all_blank

  after_commit do
    Player.update_all elo_impact: nil
    User.find_each do |user|
      EloService.new(user).current_elo
    end
  end

  def ranked?
    users.all?(&:ranked?)
  end

  def player(user)
    players.find { |player| player.user == user }
  end

  def rank(user)
    player(user).rank
  end
end
