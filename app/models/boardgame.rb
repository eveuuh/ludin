class Boardgame < ApplicationRecord
  belongs_to :user
  has_many :gamenights

  validates :name, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :players_min, presence: true
  validates :players_max, presence: true
  validates :description, presence: true
end
