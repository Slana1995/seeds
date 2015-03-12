FactoryGirl.define do  factory :user do
    username "MyString"
  end
 
  factory :author do
    name Faker::Name.name
    email Faker::Internet.email
    city Faker::Address.city 
    address Faker::Address.street_address
    born Faker::Date.between(100.years.ago, Date.today)
  end
  factory :article do
    author
    title Faker::Lorem.sentence
    text  Faker::Lorem.sentence(3, true)
  end
  factory :comment do
    article
    username Faker::Name.name 
    comment  Faker::Lorem.sentence(2, true)
  end
  factory :tag do
    name Faker::Lorem.word
  end
end