FactoryBot.define do
  factory :user do
    provider :google_auth2
    uid { Faker::Number.number(10) }
    name { Faker::Name.name }
    oauth_token { Faker::Number.number(10) }
    oauth_expires_at { Time.now }
  end
end
