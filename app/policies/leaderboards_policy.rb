class LeaderboardsPolicy < ApplicationPolicy
  def show?
    admin?
  end
end
