# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tweet.create( user_id: 1, text: "First tweet by first user!" )

# Users - Random users
user_count = 80
if User.count < user_count
  (user_count - User.count).times do
    username = Faker::Pokemon.name
    email = Faker::Internet.email
    User.create(username: username, email: email, password: 'password')
  end
end

# Tweets - Create Tweets
Tweet.create(text: Faker::ChuckNorris.fact, user_id: User.first.id)
tweet_count = 100
if Tweet.count < tweet_count + 1
  (tweet_count - Tweet.count).times do
    text = Faker::ChuckNorris.fact
    user_offset = rand(User.count)
    user_id = User.offset(user_offset).first.id
    tweet_offset = rand(Tweet.count)
    Tweet.create(text: text, user_id: user_id)
  end
end
