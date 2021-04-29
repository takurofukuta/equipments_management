require "faker"

User.destroy_all
Equipment.destroy_all
user1 = User.create!(user_name: "test1", last_name: "test", first_name: "太郎", assignment_year: 2016, password: "password")
user2 = User.create!(user_name: "test2", last_name: "test", first_name: "二郎", assignment_year: 2016, password: "password")
user3 = User.create!(user_name: "test3", last_name: "test", first_name: "三郎", assignment_year: 2016, password: "password")
3.times do |i|
Equipment.create!(genre: rand(0..5), lab_equipment_name: Faker::Device.serial, maker_name: Faker::Device.manufacturer, product_name: Faker::Device.model_name, purchase_year: rand(1990..2020), asset_num: Faker::Device.serial,
price: rand(1000..500000), remarks: "test", registered_user_id: user1.id )
end
3.times do |i|
Equipment.create!(genre: rand(0..5), lab_equipment_name: Faker::Device.serial, maker_name: Faker::Device.manufacturer, product_name: Faker::Device.model_name, purchase_year: rand(1990..2020), asset_num: Faker::Device.serial,
price: rand(1000..500000), remarks: "test", registered_user_id: user2.id )
end
3.times do |i|
Equipment.create!(genre: rand(0..5), lab_equipment_name: Faker::Device.serial, maker_name: Faker::Device.manufacturer, product_name: Faker::Device.model_name, purchase_year: rand(1990..2020), asset_num: Faker::Device.serial,
price: rand(1000..500000), remarks: "test", registered_user_id: user3.id )
end
puts "初期データの作成完了"