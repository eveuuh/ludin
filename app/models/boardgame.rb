class Boardgame < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_category, against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }


  belongs_to :user
  has_many :gamenights
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :players_min, presence: true
  validates :players_max, presence: true
  validates :description, presence: true
end
