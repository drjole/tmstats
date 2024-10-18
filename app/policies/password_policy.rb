class PasswordPolicy < ApplicationPolicy
  def update?
    owner? || admin?
  end

  private

  def owner?
    user == record
  end
end
