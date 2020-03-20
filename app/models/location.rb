class Location < ApplicationRecord
  belongs_to :user
  has_many :gamenights

  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
