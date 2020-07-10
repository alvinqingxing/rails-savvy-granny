class Category < ApplicationRecord
  has_many :jobs
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :syllabus ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
