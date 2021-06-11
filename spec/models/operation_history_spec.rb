FactoryBot.define do
  factory :operation_history do
    content { rand(0..3) }
    object { Faker::Lorem.word }
    association :operated_user, factory: :user
  end
end
