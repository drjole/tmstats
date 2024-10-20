class PasswordPolicy < ApplicationPolicy
  def update?
    owner? || super
  end

  private

  def owner?
    user == record
  end
end
