FactoryBot.define do
  factory :chapter_turn do
    association :chapter
    association :turn
  end
end
