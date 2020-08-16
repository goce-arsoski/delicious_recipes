FactoryBot.define do
  factory :recipe do
    user

    title { 'Chocolate Cookies' }
    description { 'Chewy Chocolate Cookies are soft and full of chocolate flavor like your favorite bakery cookie in just 20 minutes and you can add any mix-ins you’d like!' }
  end
end
