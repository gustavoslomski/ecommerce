FactoryBot.define do
  factory :category do
    name { Fake::Name.name }
    position { Faker::Number.digit }
  end
end
