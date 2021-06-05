FactoryBot.define do
  factory :user do
    user_name { Faker::Code.unique.npi }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    assignment_year { 2016 }
    password { "password "}
    admin { false }
  end
end
