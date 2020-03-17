class Location < ApplicationRecord
  belongs_to :user
  has_many :gamenights

  validates :name, presence: true
  validates :address, presence: true
end
