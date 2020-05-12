User.create!(name:  "Example User",
             email: "example@gotraining.com",
             password:              "gotraining",
             password_confirmation: "gotraining")

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?