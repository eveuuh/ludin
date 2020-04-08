class User < ApplicationRecord
  after_create :send_welcome_email
  has_many :boardgames, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_one_attached :photo
  # has_many :gamenights, through: :boardgames, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\..*\z/ }

  def has_a_global_rating?
    self.calculation_global_rating != nil
  end

  def calculation_global_rating
    boardgames_user = self.boardgames
    gamenights_user = []

    boardgames_user.each do |boardgame|
      gamenights = boardgame.gamenights
      gamenights.each do |gamenight|
        gamenights_user << gamenight
      end
    end

    participations_to_user_gamenights = []

    gamenights_user.each do |gamenight|
      participations = gamenight.participations
      participations.each do |participation|
        participations_to_user_gamenights << participation
      end
    end

    ratings_of_user = []

    participations_to_user_gamenights.each do |participation|
      rating = participation.rating
      ratings_of_user << rating if rating
    end

    global_rating = (ratings_of_user.sum).to_f / (ratings_of_user.size)

    return global_rating.round(1)
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

end
