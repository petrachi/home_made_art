FactoryGirl.define do
  factory :article do
    name 'article'
    sequence(:user_id) { |i| "#{i}" }
  end
end
