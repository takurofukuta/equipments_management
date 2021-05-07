require "faker"

User.destroy_all
Equipment.destroy_all
user1 = User.create!(user_name: "tarotanaka", last_name: "田中", first_name: "太郎", assignment_year: 2016, password: "password")
user2 = User.create!(user_name: "jirosato", last_name: "佐藤", first_name: "二郎", assignment_year: 2017, password: "password")
user3 = User.create!(user_name: "saburoito", last_name: "伊藤", first_name: "三郎", assignment_year: 2018, password: "password")
10.times do |i|
Equipment.create!(genre: rand(0..5), lab_equipment_name: "KJ-#{Faker::Device.manufacturer}-XXXX-XX", maker_name: Faker::Device.manufacturer, product_name: Faker::Device.model_name, purchase_year: rand(1990..2020), asset_num: "XXXX-XXXX-XXXX",
price: rand(1000..500000), remarks: "test", registered_user_id: user1.id )
end
10.times do |i|
Equipment.create!(genre: rand(0..5), lab_equipment_name: "KJ-#{Faker::Device.manufacturer}-XXXX-XX", maker_name: Faker::Device.manufacturer, product_name: Faker::Device.model_name, purchase_year: rand(1990..2020), asset_num: "XXXX-XXXX-XXXX",
price: rand(1000..500000), remarks: "test", registered_user_id: user2.id )
end
10.times do |i|
Equipment.create!(genre: rand(0..5), lab_equipment_name: "KJ-#{Faker::Device.manufacturer}-XXXX-XX", maker_name: Faker::Device.manufacturer, product_name: Faker::Device.model_name, purchase_year: rand(1990..2020), asset_num: "XXXX-XXXX-XXXX",
price: rand(1000..500000), remarks: "test", registered_user_id: user3.id )
end
puts "初期データの作成完了"