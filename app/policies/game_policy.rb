class GamePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    participant? || admin?
  end

  def destroy?
    participant? || admin?
  end

  private

  def participant?
    record.users.include? user
  end
end
