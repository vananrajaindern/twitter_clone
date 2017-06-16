class Tweet < ApplicationRecord

  validates :text, length: { maximum: 140 }
  validates :text, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_and_belongs_to_many :tags


end
