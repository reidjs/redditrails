# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = "asdfasdf"
user1 = User.create(username: Faker::Name.name, password: password)
user2 = User.create(username: Faker::Name.name, password: password)
user3 = User.create(username: Faker::Name.name, password: password)

#user1 created all the subs
sub1 = Sub.create(name: Faker::Name.title, user_id: user1.id)
sub2 = Sub.create(name: Faker::Name.title, user_id: user1.id)
sub3 = Sub.create(name: Faker::Name.title, user_id: user2.id)

#post to many subs

#User1 has 0 posts, but 3 subs
#User2 has 2 posts, and 1 sub
#user3 has 2 posts and 0 subs
post1 = Post.new(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.sentence(40),
  user_id: user2.id
)
post1.sub_ids = [1, 2]
post1.save

post2 = Post.new(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.sentence(40),
  user_id: user2.id
)
post2.sub_ids = [1, 2]
post2.save

post3 = Post.new(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.sentence(40),
  user_id: user3.id
)
post3.sub_ids = [1]
post3.save

post4 = Post.new(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.sentence(40),
  user_id: user3.id
)
post4.sub_ids = [3]
post4.save

post5 = Post.new(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.sentence(40),
  user_id: user2.id,
  parent_comment_id: post3.id
)
post4.sub_ids = [3]
post4.save
