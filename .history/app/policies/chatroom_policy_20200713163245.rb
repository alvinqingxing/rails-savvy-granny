class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.booking.user_id == user.id || record.booking.tutor_id == tutor.id
  end
end
