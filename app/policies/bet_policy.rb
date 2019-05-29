class BetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(proposer: user).or(scope.where(receiver: user))
    end

    def create?
      true
    end

    def show?
      true
    end
  end
end
