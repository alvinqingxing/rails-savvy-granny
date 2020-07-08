class Job < ApplicationRecord
  belongs_to :category
  has_many :bookings

  def price
    if self.duration == 10
      5
    else
      self.duration / 3
    end
  end
end
