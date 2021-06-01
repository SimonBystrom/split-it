class SplitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def new?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end
end
