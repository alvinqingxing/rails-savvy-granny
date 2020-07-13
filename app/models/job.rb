class Job < ApplicationRecord
  belongs_to :category
  has_many :bookings

  
  
  include PgSearch::Model
  multisearchable against: [:name, :description]




  def price
    if self.duration == 10
      5
    else
      self.duration / 3
    end
  end
end
