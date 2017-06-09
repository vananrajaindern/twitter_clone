class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :comments

  has_many :following, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :follower, class_name: 'Follow', foreign_key: 'following_id'

  def follow(followed)
    following.create!(following: followed)
  end

  def unfollow(followed)
    following.find_by(following: followed).destroy!
  end

  def following?(followed)
    following.exists?(following_id: followed)
  end

end
