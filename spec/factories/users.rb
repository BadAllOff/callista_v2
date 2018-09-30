# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email 'user@example.com'
    password '123456789'
    after(:build)   { |u| u.skip_confirmation_notification! }
    after(:create)  { |u| u.confirm }
  end
end
