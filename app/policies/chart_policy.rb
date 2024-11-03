class ChartPolicy < ApplicationPolicy
  def user_elo?
    true
  end

  def elo?
    true
  end
end
