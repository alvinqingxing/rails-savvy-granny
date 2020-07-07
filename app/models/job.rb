class Job < ApplicationRecord
  belongs_to :category
  has_many :bookings
end
