User.create!(name:  "hekai",
             namecn: "何凯",
             password:              "foobar",
             password_confirmation: "foobar",
			 role:0)

99.times do |n|
  name  = Faker::Name.name
  namecn = Faker::Name.name
  password = "password"
  User.create!(name:  name,
               namecn: namecn,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.worklogs.create!(content: content) }
end