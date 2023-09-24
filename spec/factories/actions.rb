FactoryBot.define do
  factory :action do
    sequence(:content) { |n| "test_action_content_#{n}" }
  end
end