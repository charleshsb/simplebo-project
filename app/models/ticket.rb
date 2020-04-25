class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments

  include PgSearch::Model
  pg_search_scope :search_by_description,
    against: [:description],
    using: {
      tsearch: { prefix: true }
    }
end
