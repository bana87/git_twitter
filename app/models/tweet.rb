class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments
  validates :text,
    presence: true,
    length: { maximum: 255 }
end
