class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_integrity_of :avatar
  validates_processing_of :avatar

  has_many :tweets
  has_many :comments
  has_many :likes

  has_many :is_following, class_name: 'Following', foreign_key: 'follower_id'
  has_many :is_followed, class_name: 'Following', foreign_key: 'followee_id'

  def likes?(tweet, user)
    @like = Like.find_by(tweet_id: tweet.id, user: user)
  end

end
