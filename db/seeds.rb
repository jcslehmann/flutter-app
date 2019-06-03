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
user1 = User.create!(username: "admin", first_name: "Joe", last_name: "Blogs", password: "123456", email: "joe@blogs.com", balance: 100, admin: true, ranking: 3, wins: 16, loses: 10)

puts "Created #{user1.email} as an admin!"


# Normal Users...

puts "Creating users..."

balance = (1..50).to_a.sample
user2 = User.new(first_name: "Bob", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 1, wins: 18, loses: 2)
user2.email = "#{user2.first_name}@email.com"
user2.save!

balance = (1..50).to_a.sample
user3 = User.new(first_name: "Jan", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 2, wins: 17, loses: 6)
user3.email = "#{user3.first_name}@email.com"
user3.save!

balance = (1..50).to_a.sample
user4 = User.new(first_name: "James", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 7, wins: 3, loses: 27)
user4.email = "#{user4.first_name}@email.com"
user4.save!

balance = (1..50).to_a.sample
user5 = User.new(first_name: "Anna", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 4, wins: 15, loses: 9)
user5.email = "#{user5.first_name}@email.com"
user5.save!

balance = (1..50).to_a.sample
user6 = User.new(first_name: "Inga", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 5, wins: 14, loses: 13)
user6.email = "#{user6.first_name}@email.com"
user6.save!

balance = (1..50).to_a.sample
user7 = User.new(first_name: "Zara", last_name: Faker::Name.last_name, username: Faker::Name.initials,
  password: 'password', balance: balance, remote_photo_url: "https://source.unsplash.com/random/?person", ranking: 6, wins: 15, loses: 20)
user7.email = "#{user7.first_name}@email.com"
user7.save!


puts "Created users..."

# Creating bets

puts "Creating bets!"


stake = 100
odds = 1.3
proposition = "Flutter will secure funding"
deadline =  Faker::Date.forward(10)
proposer = user1
receiver = user4
likes = []
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 10
odds = 30
proposition = "Chelsea will win Champions League"
deadline =  Faker::Date.forward(340)
proposer = user2
receiver = user5
proposer_verdict = false
receiver_verdict = false
final_outcome = false
likes = []
consensus_reached = true
status = "finished"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict, receiver_verdict: receiver_verdict,
    final_outcome: final_outcome, consensus_reached: consensus_reached)

stake = 20
odds = 1.4
proposition = "Phelim will strip"
deadline =  Faker::Date.forward(1)
proposer = user4
receiver = user5
likes = []
status = "pending"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 30
odds = 12
proposition = "Benjamin becomes Flutter CTO"
deadline =  Faker::Date.forward(50)
proposer = user7
likes =[]
receiver = user2
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 20
odds = 3
proposition = "James will give up smoking"
deadline =  Faker::Date.forward(300)
proposer = user4
likes = []
receiver = user7
status = %w[confirmed]
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status.sample)


stake = 14
odds = 2
proposition = "Flutter will build a messaging feature"
deadline =  Faker::Date.backward(1)
proposer = user3
likes = []
receiver = user1
status = "unvalidated"
proposer_verdict = false
receiver_verdict = nil
final_outcome = nil
consensus_reached = nil
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict)


stake = 300
odds = 3
proposition = "Royden will go bankrupt"
deadline =  Faker::Date.forward(200)
proposer = user6
likes = []
receiver = user2
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 1.1
proposition = "Royden will get $100m in seed funding"
deadline =  Faker::Date.forward(364)
proposer = User.first(3).sample
receiver = User.last(3).sample
likes = []
status = "pending"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 2
proposition = "There will be a second referendum"
deadline =  Faker::Date.forward(150)
proposer = user2
likes = []
receiver = user5
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 200
proposition = "FlatIron buys Le Wagon"
deadline =  Faker::Date.forward(360)
proposer = user1
receiver = user7
likes = []
status = "pending"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 30
odds = 2
proposition = "England will win the Euros"
deadline =  Faker::Date.forward(300)
proposer = user6
receiver = user2
likes = []
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 10
odds = 4
proposition = "Man City will win premiership"
deadline =  Faker::Date.backward(30)
proposer = user6
receiver = user2
likes = []
status = "finished"
proposer_verdict = true
receiver_verdict = true
final_outcome = true
consensus_reached = true
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict, receiver_verdict: receiver_verdict,
    final_outcome: final_outcome, consensus_reached: consensus_reached)



puts "Bets created!"


