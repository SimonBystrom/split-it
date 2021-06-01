class PaymentGroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true
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
end
