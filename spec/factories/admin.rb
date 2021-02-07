FactoryBot.define do
  factory :admin do
    email { "admin@example.com" }
    name { "Super Admin" }
    password { "password123" }
  end
end
