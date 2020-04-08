class Gamenight < ApplicationRecord
  belongs_to :location
  belongs_to :boardgame
  has_many :participations

  validates :date, presence: true
  validates :start_time, presence: true
  validates :location, presence: true
  validates :boardgame, presence: true
end
