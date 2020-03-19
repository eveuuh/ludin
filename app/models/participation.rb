class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :gamenight

  # validates :rating, presence: true
  # validates :description, presence: true
end
