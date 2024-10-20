class ProfilePicturePolicy < ApplicationPolicy
  def update?
    owner? || super
  end

  def destroy?
    owner? || super
  end

  private

  def owner?
    user == record
  end
end
