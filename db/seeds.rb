# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = %w(normal manager admin)
3.times {|role| Role.create name: roles[role]}


("a".."c").each do |user|
  User.create(
    email: "#{user}@gmail.com",
    password: "123456")
end

10.times do |n|
  title = Faker::Name.name
  address = Faker::Address.street_address
  Restaurant.create! title: title,
    address: address
end
