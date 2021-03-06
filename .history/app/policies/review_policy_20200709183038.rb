class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.booking.user == user
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
