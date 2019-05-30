class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def my_bets?
    true
  end

  def show?
    true
  end
end
