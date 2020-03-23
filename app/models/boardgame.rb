class Boardgame < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :user
  has_many :gamenights

  validates :name, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :players_min, presence: true
  validates :players_max, presence: true
  validates :description, presence: true


end
