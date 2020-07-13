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

puts "Making categories..."

cat1 = Category.create!(
  name: "Bill Payments",
  Job.create!(
    name: 'Utility Bills',
    description: [[true, 'Water / Electric / Gas Bills'], [true, 'Internet / Phone Bils'], [true, 'Explaining AXS or GIRO']],
    duration: [10,30,60].sample,
    category: cat1 
  ),
  Job.create!(
    name: 'Insurance Premiums',
    description: [[true, 'Life / Health / Medical insurance'], [true, 'GIRO walkthroughs']],
    duration: [10,30,60].sample,
    category: cat1 
  ),
  Job.create!(
    name: 'Fines',
    description: [[true, 'Water / Electric / Gas Bills'], [true, 'Internet / Phone Bils']],
    duration: [10,30,60].sample,
    category: cat1 
  ),
  Job.create!(
    name: 'Cash Transfers',
    description: [[true, 'Water / Electric / Gas Bills'], [true, 'Internet / Phone Bils']],
    duration: [10,30,60].sample,
    category: cat1 
  )
)

categories_with_jobs = {
    "Pay Bills & Transfer Money" => ["Water / Electric / Gas Bills", "Fines", "Insurance Premiums", "Cash Transfers"],
    "Accounts & Troubleshooting" => ["Forgot ID / password","Reset account / password"],
    "Government" => ["Singpass Related","CPF / Tax Q&A","Welfare and Subsidy support","One Motoring"],
    "Software" => ["Zoom / Video calls","Messaging","Sending/replying emails", "Microsoft Word / Excel"],
    "e-Commerce" => ["Delivery/returns","Transport / Grab"]
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
