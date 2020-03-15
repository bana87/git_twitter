class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet
  validates :nickname,
    presence: true,
    length: { maximum: 15 }
  validates :email,
    length: { maximum: 50 }
  validates :image,
    length: { maximum: 1000 }
end
