class GamePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    (participant? && recent?) || super
  end

  private

  def participant?
    record.users.include? user
  end

  def recent?
    record.time >= 3.days.ago
  end
end
