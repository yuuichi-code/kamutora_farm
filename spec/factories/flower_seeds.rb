FactoryBot.define do
  factory :flower_seed do
    sequence(:name) { |n| "test_flower_seed_name_#{n}" }
  end
end