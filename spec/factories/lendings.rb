FactoryBot.define do
  factory :lending do
    return_time { Faker::Date.backward }
    lendings_status { 0 }
    association :borrowed_equipment, factory: :equipment
    association :lending_user, factory: :user
  end
end
