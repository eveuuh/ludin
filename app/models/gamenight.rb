class Gamenight < ApplicationRecord
  belongs_to :location
  belongs_to :boardgame
  has_many :participations
  has_one_attached :photo

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
