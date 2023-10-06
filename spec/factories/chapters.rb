FactoryBot.define do
  factory :chapter do
    sequence(:chapter_number) { |n| n }
  end
end
