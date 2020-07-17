class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.chatroom.booking.user_id == user.id || record.chatroom.booking.tutor_id == user.id
  end

  def destroy?
    record.sender_id = user.id
  end
end
