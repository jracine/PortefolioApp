# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.email                 "test@test.com"
  user.password              "test"
  user.password_confirmation "test"
end
