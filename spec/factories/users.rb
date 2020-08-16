FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "testuser11281111#{n}" }
    sequence(:email) { |n| "testemail11181211#{n}@test.com" }
    first_name { 'Goce' }
    last_name { 'Arsoski' }
    password { 'goce123' }
    password_confirmation { 'goce123' }
  end
end
