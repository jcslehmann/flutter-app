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
User.create!(username: "admin", first_name: "Joe", last_name: "Blogs", password: "123456", email: "joe@blogs.com", balance: 100, admin: true, ranking: 3, wins: 16, loses: 10)

puts "Created #{User.first.email} as an admin!"


# Normal Users...

puts "Creating users..."

balance = (1..50).to_a.sample
user = User.new(first_name: "Bob", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 1, wins: 18, loses: 2)
user.email = "#{user.first_name}@email.com"
user.save!

balance = (1..50).to_a.sample
user = User.new(first_name: "Jan", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 2, wins: 17, loses: 6)
user.email = "#{user.first_name}@email.com"
user.save!

balance = (1..50).to_a.sample
user = User.new(first_name: "James", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 7, wins: 3, loses: 27)
user.email = "#{user.first_name}@email.com"
user.save!

balance = (1..50).to_a.sample
user = User.new(first_name: "Anna", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 4, wins: 15, loses: 9)
user.email = "#{user.first_name}@email.com"
user.save!

balance = (1..50).to_a.sample
user = User.new(first_name: "Inga", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 5, wins: 14, loses: 13)
user.email = "#{user.first_name}@email.com"
user.save!

balance = (1..50).to_a.sample
user = User.new(first_name: "Zara", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 6, wins: 15, loses: 20)
user.email = "#{user.first_name}@email.com"
user.save!


# 5.times do
#   balance = (1..50).to_a.sample
#   user = User.new(first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name, username: Faker::Food.dish,
#     password: 'password', balance: balance,
#     remote_photo_url: "https://source.unsplash.com/random/?person",
#     wins: (1..50).to_a.sample,
#     loses: (1..50).to_a.sample,
#     ranking: (1..5).to_a.sample)
#   user.email = "#{user.first_name}@email.com"
#   user.save!
# end


puts "Created users..."

# Creating bets

puts "Creating bets!"


stake = 100
odds = 1.3
proposition = "Flutter will secure funding"
deadline =  Faker::Date.forward(10)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "confirmed"
likes = 10
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 10
odds = 30
proposition = "Chelsea will win Champions League"
deadline =  Faker::Date.forward(340)
proposer = User.first(3).sample
receiver = User.last(3).sample
proposer_verdict = false
receiver_verdict = false
final_outcome = false
consensus_reached = true
status = "finished"
likes = 32
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict, receiver_verdict: receiver_verdict,
    final_outcome: final_outcome, consensus_reached: consensus_reached)

stake = 20
odds = 1.4
proposition = "Phelim will strip"
deadline =  Faker::Date.forward(1)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "pending"
likes = 0
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 30
odds = 12
proposition = "Benjamin becomes Flutter CTO"
deadline =  Faker::Date.forward(50)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "confirmed"
likes = 20
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 20
odds = 3
proposition = "James will give up smoking"
deadline =  Faker::Date.forward(300)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = %w[confirmed]
likes = (1..100).to_a.sample
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status.sample)


stake = 14
odds = 2
proposition = "Flutter will build a messaging feature"
deadline =  Faker::Date.backward(1)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "unvalidated"
proposer_verdict = false
receiver_verdict = nil
final_outcome = nil
consensus_reached = nil
likes = 20
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict)


stake = 300
odds = 3
proposition = "Royden will go bankrupt"
deadline =  Faker::Date.forward(200)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "confirmed"
likes = 20
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 1.1
proposition = "Royden will get $100m in seed funding"
deadline =  Faker::Date.forward(364)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "pending"
likes =
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 2
proposition = "There will be a second referendum"
deadline =  Faker::Date.forward(150)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "confirmed"
likes = 10
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 200
proposition = "FlatIron buys Le Wagon"
deadline =  Faker::Date.forward(360)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "pending"
likes =
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 30
odds = 2
proposition = "England will win the Euros"
deadline =  Faker::Date.forward(300)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "confirmed"
likes = 20
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 10
odds = 4
proposition = "Man City will win premiership"
deadline =  Faker::Date.backward(30)
proposer = User.first(3).sample
receiver = User.last(3).sample
status = "finished"
proposer_verdict = true
receiver_verdict = true
final_outcome = true
consensus_reached = true
likes = 200
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict, receiver_verdict: receiver_verdict,
    final_outcome: final_outcome, consensus_reached: consensus_reached)



# 20.times do
#   stake = (1..20).to_a.sample
#   odds = rand(1.1..50)
#   proposition = Faker::Movies::HarryPotter.quote
#   deadline =  Faker::Date.forward((1..20).to_a.sample)
#   proposer = User.first(3).sample
#   receiver = User.last(3).sample
#   status = %w[pending confirmed unvalidated finished]
#   likes = (1..100).to_a.sample
#   Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
#     proposition: proposition, proposer: proposer,
#     receiver: receiver, status: status.sample)
# end

puts "Bets created!"


