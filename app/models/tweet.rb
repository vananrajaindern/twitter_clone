class Tweet < ApplicationRecord

  belongs_to :user

  validates :text, length: { maximum: 140 }
  validates :text, presence: true

  has_many :comments
  
end
