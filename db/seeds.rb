User.create!(name:  "Example User",
             email: "example@gotraining.com",
             password:              "gotraining",
             password_confirmation: "gotraining")

99.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)

end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?