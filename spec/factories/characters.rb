FactoryBot.define do
  factory :character do
    sequence(:name) { |n| "test_name_#{n}" }
    unit_element { :fire }
    initial_rarity { 4 }
  end
end
