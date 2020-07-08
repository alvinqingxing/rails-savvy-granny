# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Message.destroy_all
Chatroom.destroy_all
Review.destroy_all
Booking.destroy_all
Job.destroy_all
Category.destroy_all
User.destroy_all




puts "Creating Users & Tutors.."

user_1 = User.create(
  first_name: "User_1",
  last_name: Faker::Name.last_name, 
  email: 'user_1@test.com',
  password: 'password',
  tutor: false
)


user_2 = User.create(
  first_name: "User_2",
  last_name: Faker::Name.last_name, 
  email: 'user_2@test.com',
  password: 'password',
  tutor: false
)

user_3 = User.create(
  first_name: "User_3",
  last_name: Faker::Name.last_name, 
  email: 'user_3@test.com',
  password: 'password',
  tutor: false
)


user_4 = User.create(
  first_name: "User_4",
  last_name: Faker::Name.last_name, 
  email: 'user_4@test.com',
  password: 'password',
  tutor: false
)

user_5 = User.create(
  first_name: "User_5",
  last_name: Faker::Name.last_name, 
  email: 'user_5@test.com',
  password: 'password',
  tutor: false
)


tutor_1 = User.create(
  first_name: "Tutor_1",
  last_name: Faker::Name.last_name, 
  email: 'tutor_1@test.com',
  password: 'password',
  tutor: true
)

tutor_2 = User.create(
  first_name: "Tutor_2",
  last_name: Faker::Name.last_name, 
  email: 'tutor_2@test.com',
  password: 'password',
  tutor: true
)

tutor_3 = User.create(
  first_name: "Tutor_3",
  last_name: Faker::Name.last_name, 
  email: 'tutor_3@test.com',
  password: 'password',
  tutor: true
)


tutor_4 = User.create(
  first_name: "Tutor_4",
  last_name: Faker::Name.last_name, 
  email: 'tutor_4@test.com',
  password: 'password',
  tutor: true
)


tutor_5 = User.create(
  first_name: "Tutor_5",
  last_name: Faker::Name.last_name, 
  email: 'tutor_5@test.com',
  password: 'password',
  tutor: true
)


puts "Making a category  & job..."

categories_with_jobs = {
    "Bills & Payment" => ["Water / Electric / Gas", "Insurance Premiums", "Fines"],
    "Transfer Money" => ["Direct cash transfer (paynow / paylah)", "International"],
    "Accounts & Computer troubleshooting" => ["Forgot ID / password","Reset account / password"],
    "Government" => ["Singpass","CPF Q&A","Elderly support","Other services"],
    "Software" => ["Sign up","Zoom / Video calls","Messaging","Sending/replying emails", "Microsoft Word / Excel","Download software","Netflix / Youtube"],
    "e-Commerce" => ["Sign up","Delivery/returns","Selling items"]
    }

categories_with_jobs.each_pair do |category, job_array|
    new_category =
    Category.create!(
        name: category
    )
    job_array.each do |job_name|
      Job.create!(
        name: job_name,
        category: new_category,
        duration: [10,30,60].sample,
        description: Faker::Job.key_skill
        )
    end
end

4.times do 
  puts "Making a booking..."
  job = Job.all.sample
  booking = Booking.create!(
    user: User.where(tutor: false).sample,   
    tutor: User.where(tutor: true).sample,
    job: job,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.forward(days: 100),
    status: ["Pending", "Accepted","Cancelled", "Completed"].sample,
    price: job.price
  )
 
  puts "Making a review"
  review = Review.create!(
    content: Faker::Quote.famous_last_words,
    rating: rand(0..5),
    booking: booking
  )

  puts "Making a chatroom..."
  chatroom = Chatroom.create!(
    booking: booking
  )
  
  puts "Making messages..."
  3.times do
  Message.create!(
      content: Faker::Quote.matz,
      sender: chatroom.booking.user,
      chatroom: chatroom,
      read: true
    )
  end

  

  3.times do
    Message.create!(
        content: Faker::Quote.matz,
        sender: chatroom.booking.tutor,
        chatroom: chatroom,
        read: true
      )
  end
end

puts "Finished!"
