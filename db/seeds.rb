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

6.times do
  balance = (1..50).to_a.sample
  user = User.new(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, username: Faker::Food.dish,
    password: 'password', balance: balance,
    remote_photo_url: "https://source.unsplash.com/random/?person")
  user.email = "#{user.first_name}@email.com"
  user.save!
end

puts "Users created!"

20.times do
  stake = (1..20).to_a.sample
  odds = rand(0.1..0.9)
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


