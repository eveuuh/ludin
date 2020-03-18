class User < ApplicationRecord
  has_many :boardgames, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :participations, dependent: :destroy
  # has_many :gamenights, through: :boardgames, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\..*\z/ }
end
