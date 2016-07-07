User.create name: "admin",
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true

User.create name: "nobita",
  email: "nobita@123.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true

User.create name: "user",
  email: "user@user.com",
  password: "123456",
  password_confirmation: "123456"

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create name: name,
    email: email,
    password: password,
    password_confirmation: password,
    is_admin: false
end
Category.create name: "Lemon"
