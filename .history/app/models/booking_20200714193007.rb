class Booking < ApplicationRecord
  has_one :chatroom, dependent: :destroy
  has_one :review, dependent: :destroy
  belongs_to :user
  belongs_to :job
  belongs_to :tutor, class_name: "User", optional: true
  monetize :price_cents
  validates :language, inclusion: %w[Chinese English Malay Tamil]
  after_validation :create_chatroom, on: :update

  after_update :create_notification_booking, if: :status_change?

  def create_chatroom
    if self.will_save_change_to_status? && self.status == "upcoming"
      Chatroom.create(booking_id: self.id)
    end
  end

  def changer
    tutor = self.tutor
    user = self.user
      if user == tutor
        user
      else
        tutor
      end
  end

  def create_notification_booking
    new_noti_booking = Notification.new(message: nil, user: self.changer, booking: self, read: false)
    new_noti_booking.save
  end
end
