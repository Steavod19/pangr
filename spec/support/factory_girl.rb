require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
  factory :group do
    title "Car Talk"
    description "this is the description of the group"
    user
  end
end
