FactoryGirl.define do
  factory :user do
    name 'User'
    email 'example@hma.com'
    password 'password'
    
    factory :user_without_password do
      password nil
    end
  end
end
