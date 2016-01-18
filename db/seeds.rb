User.create!(name:  "l",
             namecn: "李四",
             password:              "foobar",
             password_confirmation: "foobar",
			 role:0)

User.create!(name:  "z",
             namecn: "张三",
             password:              "foobar",
             password_confirmation: "foobar",
			 role:1)
User.create!(name:  "w",
             namecn: "王小二",
             password:              "foobar",
             password_confirmation: "foobar",
			 role:2)
			 
50.times do |n|
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

ProjectType.create!(name:  "规划",
             code: "gh")
ProjectType.create!(name:  "勘界",
             code: "kj")	

ProjectStatus.create!(name:  "计划")
ProjectStatus.create!(name:  "进行中")
ProjectStatus.create!(name:  "完成")
		 