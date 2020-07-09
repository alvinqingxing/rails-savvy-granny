class Booking < ApplicationRecord
  has_one :chatroom
  has_one :review
  belongs_to :user
  belongs_to :job
  belongs_to :tutor, class_name: "User", optional: true
  monetize :price_cents
end
