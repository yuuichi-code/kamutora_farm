FactoryBot.define do
  factory :turn do
    sequence(:turn_number) { |n| n }
  end
end