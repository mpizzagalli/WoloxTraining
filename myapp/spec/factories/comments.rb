FactoryGirl.define do
  factory :comment do |f|
    f.commenter Faker::Name.name
    f.body Faker::Hacker.say_something_smart
  end
end
