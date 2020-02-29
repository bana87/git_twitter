class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites
  
  validates :text,
    presence: true,
    length: { maximum: 255 }
end
