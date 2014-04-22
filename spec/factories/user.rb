FactoryGirl.define do
  factory :user do
    name 'User'
    email 'user@example.com'
    password 'password'

    factory :user_without_password do
      password nil
    end
  end
end
