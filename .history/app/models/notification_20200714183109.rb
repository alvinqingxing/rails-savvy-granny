class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  belongs_to :message



end
