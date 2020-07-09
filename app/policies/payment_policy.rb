class PaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.user == user
  end
end
