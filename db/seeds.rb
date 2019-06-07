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
user1 = User.create!(username: "asiamu", first_name: "Asia", last_name: "Mu", password: "password", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/xervi21kfyzojxtlcxaf.jpg", email: "david@email.com", balance: 100, admin: true, ranking: 3, wins: 16, loses: 10)

puts "Created #{user1.email} as an admin!"
# Normal Users...

puts "Creating users..."

balance = 20
user2 = User.new(first_name: "Liam", last_name: "Garrison", username: "javascriptliam",
  password: 'password', balance: balance, remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/vv16vr7j2a36wnqcpdbw.jpg", ranking: 1, wins: 18, loses: 2)
user2.email = "liam@email.com"
user2.save!

balance = 30
user3 = User.new(first_name: "Jan", last_name: "Linhart", username: "czechjan",
  password: 'password', balance: balance, remote_photo_url: "https://avatars2.githubusercontent.com/u/46406611?v=4", ranking: 2, wins: 17, loses: 6)
user3.email = "jan@email.com"
user3.save!

balance = 20
user4 = User.new(first_name: "James", last_name: "Bates", username: "genzjames",
  password: 'password', balance: balance, remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/s2fig1e9yccktv8qrxm0.jpg", ranking: 7, wins: 3, loses: 27)
user4.email = "james@email.com"
user4.save!

balance = 80
user5 = User.new(first_name: "Julius", last_name: "Lehmann", username: "scandijules",
  password: 'password', balance: balance, remote_photo_url: "https://avatars1.githubusercontent.com/u/48035034?v=4", ranking: 4, wins: 15, loses: 9)
user5.email = "julius@email.com"
user5.save!

balance = 40
user6 = User.new(first_name: "Harsh", last_name: "Patel", username: "speedyharsh",
  password: 'password', balance: balance, remote_photo_url: "https://avatars0.githubusercontent.com/u/45178969?v=4", ranking: 5, wins: 14, loses: 13)
user6.email = "#{user6.first_name}@email.com"
user6.save!

balance = 20
user7 = User.new(first_name: "Maria", last_name: "Rojas", username: "mariacolombia",
  password: 'password', balance: balance, remote_photo_url: "https://avatars3.githubusercontent.com/u/47041307?v=4", ranking: 6, wins: 15, loses: 20)
user7.email = "#{user7.first_name}@email.com"
user7.save!

balance = 20
user8 = User.new(first_name: "Ana", last_name: "Ghidelli", username: "anabrasilia",
  password: 'password', balance: balance, remote_photo_url: "https://avatars3.githubusercontent.com/u/48299174?v=4", ranking: 8, wins: 2, loses: 37)
user8.email = "#{user8.first_name}@email.com"
user8.save!


puts "Created users..."

# Creating bets

puts "Creating bets!"


stake = 20
odds = 1.4
proposition = "Flatiron will buy Le Wagon"
deadline =  "Jan 5, 2021, 15:37:25"
proposer = user4
receiver = user5
likes = [Like.new(user_id: 2), Like.new(user_id: 6), Like.new(user_id: 3)]
status = "pending"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 100
odds = 1.5
proposition = "Flutter will not break on demo day"
deadline =  "Jun 7, 2019, 22:00:00"
proposer = user5
receiver = user4
likes = [Like.new(user_id: 1), Like.new(user_id: 2), Like.new(user_id: 6)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 14
odds = 2
proposition = "Flutter will build a messaging feature"
deadline =  "Jun 6, 2019, 14:00:00"
proposer = user3
likes = [Like.new(user_id: 1), Like.new(user_id: 2), Like.new(user_id: 7), Like.new(user_id: 6)]
receiver = user5
status = "unvalidated"
proposer_verdict = nil
receiver_verdict = nil
final_outcome = nil
consensus_reached = nil
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict)


stake = 10
odds = 30
proposition = "PSG will win Champions League"
deadline =  "May 15, 2019, 22:00:00"
proposer = user6
receiver = user5
proposer_verdict = false
receiver_verdict = false
final_outcome = false
likes = [Like.new(user_id: 4), Like.new(user_id: 7), Like.new(user_id: 1), Like.new(user_id: 3), Like.new(user_id: 6)]
consensus_reached = true
status = "finished"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict, receiver_verdict: receiver_verdict,
    final_outcome: final_outcome, consensus_reached: consensus_reached)


stake = 20
odds = 3
proposition = "James will give up smoking"
deadline =  "Jun 6, 2020, 12:00:00"
proposer = user4
likes = [Like.new(user_id: 2), Like.new(user_id: 3), Like.new(user_id: 5)]
receiver = user7
status = %w[confirmed]
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status.sample)



stake = 10
odds = 99
proposition = "Liam will overcome Jeff Bezos"
deadline =  "Jun 8, 2021, 12:00:00"
proposer = user2
receiver = user4
likes = [Like.new(user_id: 1), Like.new(user_id: 5), Like.new(user_id: 6)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 30
odds = 12
proposition = "Benjamin will become Flutter CTO"
deadline =  "Aug 15, 2019, 12:00:00"
proposer = user7
likes =[Like.new(user_id: 1), Like.new(user_id: 3), Like.new(user_id: 6)]
receiver = user2
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 25
odds = 3
proposition = "Ana will slap Katherine"
deadline =  "July 8, 2019, 18:00:00"
proposer = user8
receiver = user3
likes = [Like.new(user_id: 2), Like.new(user_id: 4), Like.new(user_id: 5)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 4
proposition = "There will be a second referendum"
deadline =  "Jan 7, 2019, 18:00:00"
proposer = user2
likes = [Like.new(user_id: 1), Like.new(user_id: 2), Like.new(user_id: 7), Like.new(user_id: 6), Like.new(user_id: 3)]
receiver = user6
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 20
odds = 1.1
proposition = "Royden will raise a $10m seed round"
deadline =  "Jun 7, 2020, 18:00:00"
proposer = user3
receiver = user2
likes = [Like.new(user_id: 1), Like.new(user_id: 4), Like.new(user_id: 3)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 30
odds = 2
proposition = "England will win the Euros"
deadline =  "Jun 7, 2020, 18:00:00"
proposer = user6
receiver = user2
likes = [Like.new(user_id: 3), Like.new(user_id: 6), Like.new(user_id: 1), Like.new(user_id: 7), Like.new(user_id: 5)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)

stake = 20
odds = 60
proposition = "This will be the hottest summer ever"
deadline =  "Oct 10, 2019, 18:00:00"
proposer = user3
receiver = user6
likes = [Like.new(user_id: 1), Like.new(user_id: 2)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)


stake = 10
odds = 978
proposition = "Ants will take over the world"
deadline =  "May 7, 2030, 18:00:00"
proposer = user6
receiver = user2
likes = [Like.new(user_id: 1), Like.new(user_id: 2), Like.new(user_id: 7), Like.new(user_id: 6), Like.new(user_id: 3)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status, proposer_verdict: proposer_verdict, receiver_verdict: receiver_verdict)



stake = 30
odds = 5
proposition = "England will win the Cricket World Cup"
deadline =  "July 7, 2019, 18:00:00"
proposer = user1
receiver = user7
likes = [Like.new(user_id: 2), Like.new(user_id: 4), Like.new(user_id: 5)]
status = "confirmed"
Bet.create!(stake: stake, odds: odds, deadline: deadline, likes: likes,
    proposition: proposition, proposer: proposer,
    receiver: receiver, status: status)



puts "Bets created!"


