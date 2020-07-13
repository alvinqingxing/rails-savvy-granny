class Booking < ApplicationRecord
  has_one :chatroom
  has_one :review
  belongs_to :user
  belongs_to :job
  belongs_to :tutor, class_name: "User", optional: true
  monetize :price_cents
  validates :language, inclusion: %w[Chinese English Malay Tamil]
  after_validation :create_chatroom, on: :update

  def create_chatroom
    if self.will_save_change_to_status? && self.status == "upcoming"
      Chatroom.create(booking_id: self.id)
    end
  end
end
