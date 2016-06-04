def create_user(email, password)
  User.create(
    code: email,
    name: email,
    email: email,
    password: password,
    password_confirmation: password
  )
end

10.times do |i|
  create_user(format("guest%02d", i), 'guest')
end
