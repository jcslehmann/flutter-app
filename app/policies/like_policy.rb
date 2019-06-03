class LikePolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    record.receiver == user || record.proposer == user
  end

  def edit?
    update?
  end
  def destroy?
    true
  end
end
