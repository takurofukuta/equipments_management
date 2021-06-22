FactoryBot.define do
  factory :equipment do
    genre { rand(0..5) }
    lab_equipment_name { "KJ-#{Faker::Device.manufacturer}-#{rand(0..100)}-#{rand(0..100)}" }
    maker_name { Faker::Device.manufacturer }
    product_name { Faker::Device.model_name }
    purchase_year { rand(1990..2020) }
    asset_num { "XXXX-XXXX-XXXX" }
    price { rand(1000..500000) }
    remarks { "test" }
    association :registered_user, factory: :user
  end
end
