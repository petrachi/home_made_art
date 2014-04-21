FactoryGirl.define do
  factory :article do
    name 'article'
    sequence(:user_id) { |i| "#{i}" }

    #factory :article_mandatory do
    #end
  end
end
