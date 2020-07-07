class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :chatrooms
  has_many :reviews
end
