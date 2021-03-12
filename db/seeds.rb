# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
first_day = Date.current.prev_month.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
ActiveRecord::Base.transaction do
  one_month.each do |day| 
    Attendance.create!(user_id: 1,
                        worked_on: day,
                        started_at: Time.current.change(hour: 9, min: 59),
                        finished_at: Time.current.change(hour: 18, min: 0))
  end
end

2.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end