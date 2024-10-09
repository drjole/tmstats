class GamePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    participant?
  end

  def destroy?
    participant?
  end

  private

  def participant?
    record.users.include? user
  end
end
