# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include RandomData
# Create Posts
15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
        )
    end
    topics = Topic.all

50.times do
    Sponsored_Post.create!(
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
    end
    sponsored_post = Sponsored_Post.all    
    
50.times do
# #1
   Post.create!(
# #2
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
# Create Comments
# #3
100.times do
   Comment.create!(
# #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
100.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
    )
 end
 
 puts "#{Post.count}"
 Post.find_or_create_by(title: "A unique title", body: "A unique body")
 puts "#{Post.count}"
 
 puts "#{Sponsored_Post.count}"
 Sponsored_Post.find_or_create_by(title: "A unique title", body: "A unique body")
 puts "#{Sponsored_Post.count}"
 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
 puts "#{Sponsored_Post.count} sponsored post created"
 