FactoryBot.define do
  factory :equipment do
    genre { "camera" }
    lab_equipment_name { "KJ-#{Faker::Device.manufacturer}-#{rand(0..100)}-#{rand(0..100)}" }
    maker_name { Faker::Device.manufacturer }
    product_name { Faker::Device.model_name }
    purchase_year { rand(1990..2020) }
    asset_num { "#{rand(1000..2000)}-#{rand(1000..2000)}-#{rand(1000..2000)}" }
    price { rand(1000..500000) }
    remarks { Faker::Lorem.sentence }
    association :registered_user, factory: :user
  end

  trait :invalid do
    genre { nil }
  end
end

