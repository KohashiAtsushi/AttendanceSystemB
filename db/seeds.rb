# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

2.times do |n|
  name  = Faker::Name.name
  email = "sample#{n+1}@email.com"
  password = "password"
  User.create!(name: "上長ユーザ#{n+1}",
               email: email,
               password: password,
               password_confirmation: password,
               superior: true)

  email2 = "sample#{n+100}@email.com"
  User.create!(name: name,
               email: email2,
               password: password,
               password_confirmation: password)
end