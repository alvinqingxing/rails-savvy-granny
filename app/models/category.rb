class Category < ApplicationRecord
  has_many :jobs
  
  include PgSearch::Model
  multisearchable against: [:name]


end
