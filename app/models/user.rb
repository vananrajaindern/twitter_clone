class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :comments

  has_many :is_following, class_name: 'Following', foreign_key: 'follower_id'
  has_many :is_followed, class_name: 'Following', foreign_key: 'followee_id'

end
