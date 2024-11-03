class ChartPolicy < ApplicationPolicy
  def user_elo?
    true
  end
end
