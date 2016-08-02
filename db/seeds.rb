User.create! username: "Example User", email: "example@railstutorial.org",
  password: "foobar", password_confirmation: "foobar"

50.times do |n|
  username = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! username: username, email: email, password: password,
    password_confirmation: password
end

# users = User.order(:created_at).take(6)

users = User.all
user = users.first
following = users[2..50]
followers = users[3..30]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}
