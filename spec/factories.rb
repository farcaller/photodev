require 'factory_girl'

Factory.define :user do |u|
  u.username 'TestUser'
  u.email 'user@test.com'
  u.password 'please'
end