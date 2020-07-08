class Booking < ApplicationRecord
  has_one :chatroom
  has_one :review
  belongs_to :user
  belongs_to :job
end
