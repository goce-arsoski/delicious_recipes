FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "testemail#{n}@test.com" }
    first_name { "Goce" }
    last_name { "Arsoski" }
    password { "goce123" }
    password_confirmation { "goce123" }
  end
end
