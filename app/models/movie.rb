class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model
  pg_search_scope :search, against: [:title, :year],
  associated_against: {
    director: [:first_name, :last_name]
  },
  using: {
    :tsearch => { :prefix => true }
}
end
