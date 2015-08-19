require 'faker'

#Create Posts
=begin 50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end
=end
#Assignment 32; creation of unique posts
post_attributes = [
  {title: "Post created 1", body: "Body created 1"},
  {title: "Post created 2", body: "Body created 2"},
]

post_attributes.each{|attributes|
  Post.where(attributes).first_or_create
}

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
