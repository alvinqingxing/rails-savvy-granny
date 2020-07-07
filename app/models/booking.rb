class Booking < ApplicationRecord
  has_one :chatroom
  has_one :user
  has_one :review
  has_one :job
end
