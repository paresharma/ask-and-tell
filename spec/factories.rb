# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider :google_auth2
    uid { Faker::Number.number(10) }
    name { Faker::Name.name }
    oauth_token { Faker::Number.number(10) }
    oauth_expires_at { Time.now }
  end

  factory :question do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }

    user
  end

  factory :answer do
    description { Faker::Lorem.paragraph }

    question
    user
  end
end
