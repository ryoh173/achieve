n = 302
while n <= 401
  Blog.create(
    title: "Hello",
    content: "World",
    user_id: n
  )
  n = n + 1
end

100.times do |n|
  email = Faker::Internet.email
  name = Faker::Internet.user_name
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               )
end