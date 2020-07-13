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
  first_name: "Sarah",
  last_name: "Wong", 
  email: 'user_1@test.com',
  password: 'password',
  tutor: false
)

user_2 = User.create(
  first_name: "Nicholas",
  last_name: "Lim", 
  email: 'user_2@test.com',
  password: 'password',
  tutor: false
)

user_3 = User.create(
  first_name: "Suzana",
  last_name: "Bte Mohd Yusof", 
  email: 'user_3@test.com',
  password: 'password',
  tutor: false
)

user_4 = User.create(
  first_name: "Linesh",
  last_name: "Pillai", 
  email: 'user_4@test.com',
  password: 'password',
  tutor: false
)

tutor_1 = User.create(
  first_name: "Xavier",
  last_name: "Ng", 
  email: 'tutor_1@test.com',
  password: 'password',
  tutor: true
)

tutor_2 = User.create(
  first_name: "Ashley",
  last_name: "Sim", 
  email: 'tutor_2@test.com',
  password: 'password',
  tutor: true
)

tutor_3 = User.create(
  first_name: "Muhammad ",
  last_name: "bin Ibrahim", 
  email: 'tutor_3@test.com',
  password: 'password',
  tutor: true
)

puts "Making categories & jobs..."

puts "Making Bill Payments"
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

puts "Making Accounts & Troubleshooting"
cat2 = Category.create!(
  name: "Accounts & Troubleshooting"
)

job5 = Job.create!(
  name: 'New Accounts or Signups',
  description: [[true, 'Login page walkthroughs'], [true, 'Creating secure passwords']],
  duration: [10,30,60].sample,
  category: cat2
)
job6 = Job.create!(
  name: 'Forgotten Information or Passwords',
  description: [[true, 'For already existing accounts'], [true, 'Resetting passwords or updating info']],
  duration: [10,30,60].sample,
  category: cat2 
)
pic5 = URI.open('https://i.imgur.com/XA7piE3.jpg')
pic6 = URI.open('https://i.imgur.com/aaMCFQ9.jpg')
job5.photo.attach(io: pic5, filename: 'accounts.jpg', content_type: 'image/jpg')
job6.photo.attach(io: pic6, filename: 'passwords.jpg', content_type: 'image/jpg')

puts "Making Government Services"
cat3 = Category.create!(
  name: "Government Services"
)

job7 = Job.create!(
  name: 'Singpass Issues',
  description: [[true, 'Forgot account ID/Password'], [true, 'Accessing Singpass services'], [true, 'Updating personal info']],
  duration: [10,30,60].sample,
  category: cat3
)
job8 = Job.create!(
  name: 'CPF / Tax Q&A',
  description: [[true, 'CPF / IRAS website walkthroughs'], [true, 'Viewing CPF / Tax accounts']],
  duration: [10,30,60].sample,
  category: cat3
)
job9 = Job.create!(
  name: 'Welfare & Subsidy Support',
  description: [[true, 'Understanding grant eligibility (e.g. CHAS)'], [true, 'Online applications for ocial support']],
  duration: [10,30,60].sample,
  category: cat3
)
job10 = Job.create!(
  name: 'One Motoring',
  description: [[true, 'Website walkthroughs and Q&A'], [true, 'PARF value, road taxes, estate parking']],
  duration: [10,30,60].sample,
  category: cat3
)
pic7 = URI.open('https://i.imgur.com/Tvx0XXi.jpg')
pic8 = URI.open('https://i.imgur.com/yWgY4xv.jpg')
pic9 = URI.open('https://i.imgur.com/Eckxu9f.jpg')
pic10 = URI.open('https://i.imgur.com/9bFqvOE.jpg')
job7.photo.attach(io: pic7, filename: 'singpass.jpg', content_type: 'image/jpg')
job8.photo.attach(io: pic8, filename: 'cpftax.jpg', content_type: 'image/jpg')
job9.photo.attach(io: pic9, filename: 'welfare.jpg', content_type: 'image/jpg')
job10.photo.attach(io: pic10, filename: 'onemotoring.jpg', content_type: 'image/jpg')

puts "Making Commonly Used Software"
cat4 = Category.create!(
  name: "Commonly Used Software"
)

job11 = Job.create!(
  name: 'Zoom / Video Calls',
  description: [[true, 'How to use Zoom / Skype, etc.'], [true, 'Accounts and personal info']],
  duration: [10,30,60].sample,
  category: cat4
)
job12 = Job.create!(
  name: 'Messaging Apps',
  description: [[true, 'WhatsApp Web, FB Messenger, etc.'], [true, 'Customising keyboards, sending photos, emojis']],
  duration: [10,30,60].sample,
  category: cat4
)
job13 = Job.create!(
  name: 'Sending / Replying emails',
  description: [[true, 'Creating new accounts, navigating Gmail'], [true, 'Attaching files and images']],
  duration: [10,30,60].sample,
  category: cat4
)
job14 = Job.create!(
  name: 'Microsoft Office',
  description: [[true, 'Word, Excel, Powerpoint'], [true, 'File saving or converting to PDF']],
  duration: [10,30,60].sample,
  category: cat4
)
pic11 = URI.open('https://i.imgur.com/01FtFnO.jpg')
pic12 = URI.open('https://i.imgur.com/vkK6DLO.jpg')
pic13 = URI.open('https://i.imgur.com/dEpMyO8.jpg')
pic14 = URI.open('https://i.imgur.com/DVnYkfp.jpg')
job11.photo.attach(io: pic11, filename: 'zoom.jpg', content_type: 'image/jpg')
job12.photo.attach(io: pic12, filename: 'whatsapp.jpg', content_type: 'image/jpg')
job13.photo.attach(io: pic13, filename: 'email.jpg', content_type: 'image/jpg')
job14.photo.attach(io: pic14, filename: 'office.jpg', content_type: 'image/jpg')

puts "Making e-Commerce"
cat5 = Category.create!(
  name: "e-Commerce"
)

job15 = Job.create!(
  name: 'Orders, Delivery & Returns',
  description: [[true, 'Lazada / Redmart / Amazon sign ups'], [true, 'Food Delivery (Grabfood, etc)'], [true, 'Returns and Tracking']],
  duration: [10,30,60].sample,
  category: cat5
)
job16 = Job.create!(
  name: 'Transport / Grab',
  description: [[true, 'Using Grab / Gojek / Comfort']],
  duration: [10,30,60].sample,
  category: cat5
)
pic15 = URI.open('https://i.imgur.com/rYBiI69.jpg')
pic16 = URI.open('https://i.imgur.com/hwXToES.jpg')
job15.photo.attach(io: pic15, filename: 'accounts.jpg', content_type: 'image/jpg')
job16.photo.attach(io: pic16, filename: 'passwords.jpg', content_type: 'image/jpg')

# BOOKINGS BELOW
puts "Making an upcoming booking with messages..."
job = Job.all.sample
booking = Booking.create!(
  user: user_1,   
  tutor: tutor_1,
  job: job,
  start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
  start_date: Faker::Date.forward(days: 30),
  status: "upcoming",
  price: job.price,
  language: "Chinese"
)

puts "Making a chatroom..."
chatroom = Chatroom.create!(
  booking: booking
)

puts "Making messages..."
Message.create!(
    content: "Hi, thanks for taking this booking. Are you familiar with this technology?",
    sender: chatroom.booking.user,
    chatroom: chatroom,
    read: true
)

Message.create!(
      content: "Yes, you can trust me! (:",
      sender: chatroom.booking.tutor,
      chatroom: chatroom,
      read: true
)

Message.create!(
    content: "That's good to know. It's the first time for my mother, so please don't rush.",
    sender: chatroom.booking.user,
    chatroom: chatroom,
    read: true
)

  Message.create!(
      content: "I'll be careful to take things slowly, don't worry about it.",
      sender: chatroom.booking.tutor,
      chatroom: chatroom,
      read: true
)

3.times do 
  puts "Making upcoming bookings..."
  job = Job.all.sample
  booking = Booking.create!(
    user: user_1,   
    tutor: [tutor_1, tutor_2].sample,
    job: job,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.forward(days: 30),
    status: "upcoming",
    price: job.price,
    language: "Chinese"
  )

  puts "Making a chatroom..."
  chatroom = Chatroom.create!(
    booking: booking
  )
end

2.times do 
  puts "Making a completed booking..."
  job2 = Job.all.sample
  booking2 = Booking.create!(
    user: user_1,
    tutor: [tutor_1, tutor_2].sample,   
    job: job2,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "completed",
    price: job2.price,
    language: "Chinese"
  )

  puts "Making a chatroom..."
  chatroom2 = Chatroom.create!(
    booking: booking2
  )
  
  puts "Making a review"
  review2 = Review.create!(
    content: Faker::Quote.famous_last_words,
    rating: rand(0..5),
    booking: booking2
  )
end

2.times do 
  puts "Making a completed booking..."
  job3 = Job.all.sample
  booking3 = Booking.create!(
    user: user_1,
    tutor: [tutor_1, tutor_2].sample,   
    job: job3,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "completed",
    price: job3.price,
    language: "Chinese"
  )

  puts "Making a chatroom..."
  chatroom3 = Chatroom.create!(
    booking: booking3
  )
end

2.times do 
  puts "Making a pending booking..."
  job4 = Job.all.sample
  booking4 = Booking.create!(
    user: user_1,
    job: job4,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "pending",
    price: job4.price,
    language: "Chinese"
  )

  puts "Making a chatroom..."
  chatroom4 = Chatroom.create!(
    booking: booking4
  )
end

2.times do 
  puts "Making a pending booking..."
  job = Job.all.sample
  booking = Booking.create!(
    user: user_2,
    job: job4,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "pending",
    price: job4.price,
    language: "Chinese"
  )

  puts "Making a chatroom..."
  chatroom = Chatroom.create!(
    booking: booking
  )
end

2.times do 
  puts "Making a pending booking..."
  job = Job.all.sample
  booking = Booking.create!(
    user: user_3,
    job: job4,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "pending",
    price: job4.price,
    language: "Malay"
  )

  puts "Making a chatroom..."
  chatroom = Chatroom.create!(
    booking: booking
  )
end

1.times do 
  puts "Making a pending booking..."
  job = Job.all.sample
  booking = Booking.create!(
    user: user_4,
    job: job4,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "pending",
    price: job4.price,
    language: "Tamil"
  )

  puts "Making a chatroom..."
  chatroom = Chatroom.create!(
    booking: booking
  )
end

3.times do 
  puts "Making a completed booking..."
  job2 = Job.all.sample
  booking2 = Booking.create!(
    user: [user_1, user_2].sample,
    tutor: tutor_1,   
    job: job2,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "completed",
    price: job2.price,
    language: "Chinese"
  )

  puts "Making a chatroom..."
  chatroom2 = Chatroom.create!(
    booking: booking2
  )
  
  puts "Making a review"
  review2 = Review.create!(
    content: Faker::Quote.famous_last_words,
    rating: rand(0..5),
    booking: booking2
  )
end

2.times do 
  puts "Making a completed booking..."
  job2 = Job.all.sample
  booking2 = Booking.create!(
    user: user_2,
    tutor: tutor_1,   
    job: job2,
    start_time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    start_date: Faker::Date.backward(days: 100),
    status: "completed",
    price: job2.price,
    language: "Chinese"
  )

  puts "Making a chatroom..."
  chatroom2 = Chatroom.create!(
    booking: booking2
  )
end

puts "Finished!"
