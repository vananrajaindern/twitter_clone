class Comment < ApplicationRecord

  belongs_to :tweet
  belongs_to :user

  validates :text, length: { maximum: 140 }
  validates :text, presence: true
  
end
