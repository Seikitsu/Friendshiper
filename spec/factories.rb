FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "p4ssw0rd"
    password_confirmation "p4ssw0rd"
  end
end