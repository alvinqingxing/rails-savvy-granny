class Review < ApplicationRecord
  alias_attribute :users, :tutors
  belongs_to :booking
  # belongs_to :tutor, through: :booking
end
