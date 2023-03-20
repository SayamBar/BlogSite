FactoryBot.define do
  factory :user do
    email { "admin@gmail.com" }
    password { "password" } 
    fullname { "Admin" }
    bio { "Software Engineer" }
    gender { "male" }
    phone { "9072065098" }
  end
end
