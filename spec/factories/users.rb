FactoryBot.define do
  factory :user do
    user_name { "satou_maruo"}
    last_name { "佐藤" }
    first_name { "丸男" }
    assignment_year { 2016 }
    password { "password "}
  end
end
