class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.tutor?
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def index?
    user.tutor?
  end

  def new?
    record.user == user
  end

  def create?
    record.user == user
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def apply?
    user.tutor?
  end

  def cancel?
    user
  end
end
