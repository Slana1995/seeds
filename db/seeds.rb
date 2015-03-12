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
10.times do
  tag = FactoryGirl.create(:tag)
end
5.times do
  author = FactoryGirl.create(:author)
  3.times do
    article = FactoryGirl.create(:article, author:author)
    2.times do
      comment = FactoryGirl.create(:comment, article:article)
    end
  end
end