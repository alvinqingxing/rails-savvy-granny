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

puts "Creating users & tutors.."

user_1 = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, 
  email: 'user_1@test.com',
  password: 'password',
  tutor: false
)


user_2 = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, 
  email: 'user_2@test.com',
  password: 'password',
  tutor: false
)

user_3 = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, 
  email: 'user_3@test.com',
  password: 'password',
  tutor: false
)

tutor_1 = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, 
  email: 'tutor_1@test.com',
  password: 'password',
  tutor: true
)

tutor_2 = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, 
  email: 'tutor_2@test.com',
  password: 'password',
  tutor: true
)

tutor_3 = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, 
  email: 'tutor_3@test.com',
  password: 'password',
  tutor: true
)

puts "Making categories & jobs..."

cat1 = Category.create!(
  name: "Bill Payments"
)

job1 = Job.create!(
  name: 'Utility Bills',
  description: [[true, 'Water / Electric / Gas bills'], [true, 'Internet / Phone bils'], [true, 'GIRO walkthroughs']],
  duration: [10,30,60].sample,
  category: cat1
)
job2 = Job.create!(
  name: 'Insurance Premiums',
  description: [[true, 'Life / Health / Medical insurance'], [true, 'GIRO walkthroughs'], [false, 'Insurer information not required']],
  duration: [10,30,60].sample,
  category: cat1 
)
job3 = Job.create!(
  name: 'Fines',
  description: [[true, 'Parking & LTA fines'], [true, 'HDB/URA/NEA & AXS walkthroughs']],
  duration: [10,30,60].sample,
  category: cat1 
)
job4 = Job.create!(
  name: 'Cash Transfers',
  description: [[true, 'Paynow / Paylah / PayAnyone'], [true, 'Includes account setup']],
  duration: [10,30,60].sample,
  category: cat1 
)
pic1 = URI.open('https://i.imgur.com/YQhdvmf.jpg')
pic2 = URI.open('https://i.imgur.com/zmP8Yl6.jpg')
pic3 = URI.open('https://i.imgur.com/ZbomQWx.jpg')
pic4 = URI.open('https://i.imgur.com/ZlMMiH5.jpg')
job1.photo.attach(io: pic1, filename: 'bills.jpg', content_type: 'image/jpg')
job2.photo.attach(io: pic2, filename: 'insurance.jpg', content_type: 'image/jpg')
job3.photo.attach(io: pic3, filename: 'parking.jpg', content_type: 'image/jpg')
job4.photo.attach(io: pic4, filename: 'transfer.jpg', content_type: 'image/jpg')

cat1 = Category.create!(
  name: "Accounts & Troubleshooting"
)

job1 = Job.create!(
  name: 'New Accounts or Signups',
  description: [[true, 'Login page walkthroughs'], [true, 'Creating secure passwords']],
  duration: [10,30,60].sample,
  category: cat1
)
job2 = Job.create!(
  name: 'Forgotten Information or Passwords',
  description: [[true, 'Resetting passwords'], [true, 'GIRO walkthroughs'], [false, 'Insurer information not required']],
  duration: [10,30,60].sample,
  category: cat1 
)


5.times do 
  puts "Making a booking..."
  job = Job.all.sample
  booking = Booking.create!(
    user: User.where(tutor: false).sample,   
    tutor: User.where(tutor: true).sample,
    job: job,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.forward(days: 100),
    status: ["upcoming","cancelled"].sample,
    price: job.price
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

5.times do 
  puts "Making a completed booking..."
  job2 = Job.all.sample
  booking2 = Booking.create!(
    user: User.where(tutor: false).sample,
    tutor: User.where(tutor: true).sample,   
    job: job2,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "completed",
    price: job2.price
  )
  
  puts "Making a review"
  review2 = Review.create!(
    content: Faker::Quote.famous_last_words,
    rating: rand(0..5),
    booking: booking2
  )

  puts "Making a chatroom..."
  chatroom2 = Chatroom.create!(
    booking: booking2
  )
  
  puts "Making messages..."
  3.times do
  Message.create!(
      content: Faker::Quote.matz,
      sender: chatroom2.booking.user,
      chatroom: chatroom2,
      read: true
    )
  end

  3.times do
    Message.create!(
        content: Faker::Quote.matz,
        sender: chatroom2.booking.tutor,
        chatroom: chatroom2,
        read: true
      )
  end
end

5.times do 
  puts "Making a completed booking..."
  job2 = Job.all.sample
  booking2 = Booking.create!(
    user: User.where(tutor: false).sample,
    tutor: User.where(tutor: true).sample,   
    job: job2,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "completed",
    price: job2.price
  )

  puts "Making a chatroom..."
  chatroom2 = Chatroom.create!(
    booking: booking2
  )
  
  puts "Making messages..."
  3.times do
  Message.create!(
      content: Faker::Quote.matz,
      sender: chatroom2.booking.user,
      chatroom: chatroom2,
      read: true
    )
  end

  3.times do
    Message.create!(
        content: Faker::Quote.matz,
        sender: chatroom2.booking.tutor,
        chatroom: chatroom2,
        read: true
      )
  end
end

5.times do 
  puts "Making a pending booking..."
  job3 = Job.all.sample
  booking3 = Booking.create!(
    user: User.where(tutor: false).sample,   
    job: job3,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.forward(days: 100),
    status: "pending",
    price: job3.price
  )

  puts "Making a chatroom..."
  chatroom3 = Chatroom.create!(
    booking: booking3
  )
  
end

puts "Finished!"
