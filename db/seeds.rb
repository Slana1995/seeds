# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 20.times do
#   Author.create(name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, address: Faker::Address.street_address, born: Faker::Date.backward(100))
# end
puts "Generate seed"
20.times do 
  tag = FactoryGirl.create(:tag)
end
20.times do |i|
  puts "Author #{i}"
  author = FactoryGirl.create(:author)
  rand(1..10).times do
    article = FactoryGirl.create(:article, author:author)
    article.tags << [Tag.all.sample(3)]
    rand(0..10).times do
      comment = FactoryGirl.create(:comment, article:article)
    end
  end
end