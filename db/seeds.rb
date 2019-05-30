# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'json'
require 'open-uri'
require 'faker'

puts 'Destroying old users and bets!'

User.destroy_all
Bet.destroy_all

puts 'Making an admin!'

# Admin User
User.create!(username: "admin", first_name: "Joe", last_name: "Blogs", password: "123456", email: "joe@blogs.com", balance: 100, admin: true)

puts "created #{User.first.email} as an admin!"


# balance = (1..50).to_a.sample
# user = User.new(first_name: "Peter", last_name: Faker::Name.last_name, username: Faker::Name.initials,
#   password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 1, wins: 18, loses: 2)
# user.email = "#{user.first_name}@email.com"
# user.save!

# balance = (1..50).to_a.sample
# user = User.new(first_name: "Alice", last_name: Faker::Name.last_name, username: Faker::Name.initials,
#   password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 2, wins: 17, loses: 3)
# user.email = "#{user.first_name}@email.com"
# user.save!

# balance = (1..50).to_a.sample
# user = User.new(first_name: "Ben", last_name: Faker::Name.last_name, username: Faker::Name.initials,
#   password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 3, wins: 16, loses: 4)
# user.email = "#{user.first_name}@email.com"
# user.save!

# balance = (1..50).to_a.sample
# user = User.new(first_name: "Jim", last_name: Faker::Name.last_name, username: Faker::Name.initials,
#   password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 4, wins: 15, loses: 5)
# user.email = "#{user.first_name}@email.com"
# user.save!

# balance = (1..50).to_a.sample
# user = User.new(first_name: "Frank", last_name: Faker::Name.last_name, username: Faker::Name.initials,
#   password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 5, wins: 14, loses: 6)
# user.email = "#{user.first_name}@email.com"
# user.save!

# balance = (1..50).to_a.sample
# user = User.new(first_name: "John", last_name: Faker::Name.last_name, username: Faker::Name.initials,
#   password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 6, wins: 13, loses: 7)
# user.email = "#{user.first_name}@email.com"
# user.save!


6.times do
  balance = (1..50).to_a.sample
  user = User.new(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, username: Faker::Food.dish,
    password: 'password', balance: balance,
    remote_photo_url: "https://source.unsplash.com/random/?person",
    wins: (1..50).to_a.sample,
    loses: (1..50).to_a.sample,
    ranking: (1..6).to_a.sample)
  user.email = "#{user.first_name}@email.com"
  user.save!
end

puts "Users created!"

20.times do
  stake = (1..20).to_a.sample
  odds = rand(1.1..50)
  proposition = Faker::Movies::HarryPotter.quote
  deadline =  Faker::Date.forward((1..20).to_a.sample)
  proposer = User.first(3).sample
  receiver = User.last(3).sample
  status = %w[pending confirmed unvalidated finished]
  likes = (1..100).to_a.sample
  Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status.sample)
end

puts "Bets created!"


