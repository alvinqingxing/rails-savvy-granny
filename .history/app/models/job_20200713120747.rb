class Job < ApplicationRecord
  belongs_to :category
  has_many :bookings
  has_one_attached :photo

  include PgSearch::Model
  multisearchable against: [:name, :description]

  def price
    if duration == 10
      5
    else
      duration / 3
    end
  end
end
