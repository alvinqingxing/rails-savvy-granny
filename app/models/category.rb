class Category < ApplicationRecord
  has_many :jobs
  
  include PgSearch::Model
  multisearchable against: [:name]

  def html_name
    name.downcase.gsub("&", "").split.join
  end


end
