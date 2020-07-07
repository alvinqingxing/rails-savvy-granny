class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :chatrooms
end
