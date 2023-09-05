FactoryBot.define do
  factory :support_character do
    association :post
    association :character
  end
end
