class PaymentPolicy < ApplicationPolicy
  def new?
    record.user == user
  end
end
