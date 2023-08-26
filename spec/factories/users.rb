FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
