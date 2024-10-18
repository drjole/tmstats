class ProfilePicturePolicy < ApplicationPolicy
  def update?
    owner? || admin?
  end

  def destroy?
    owner? || admin?
  end

  private

  def owner?
    user == record
  end
end
