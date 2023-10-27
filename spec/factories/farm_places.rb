FactoryBot.define do
  factory :farm_place do
    sequence(:farm_number) { |n| n }
  end
end