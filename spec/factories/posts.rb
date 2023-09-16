FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title_#{n}" }
    association :user
  end
end
