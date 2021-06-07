require 'open-uri'

=begin
Basic User Journey Generation

Group 1:
2 users (User1, User2)
1 split (couple)
each users creates 5 bills/receipts

Group 2:
4 users (User3..6)
2 splits (Bowling, Camping)
each user creates 4 receipts in each split
=end

puts "You have requested seeds. Launching processes..."

puts "Deleting previous seeds..."
Membership.destroy_all ? (puts "All Memberships destroyed successfully") : (puts "Could not destroy Memberships...")
Bill.destroy_all ? (puts "All Bills destroyed successfully") : (puts "Could not destroy Bills...")
User.destroy_all ? (puts "All Users destroyed successfully") : (puts "Could not destroy Users...")
Split.destroy_all ? (puts "All Splits destroyed successfully") : (puts "Could not destroy Splits...")
PaymentGroup.destroy_all ? (puts "All PaymentGroups destroyed successfully") : (puts "Could not destroy PaymentGroups...")



puts "Generating Couple group..."

couple_photo = URI.open ('https://source.unsplash.com/800x600/?couple')
couple_group = PaymentGroup.new( name: "Couple", description: "A household group", token: PaymentGroup.generate_unique_secure_token )
couple_group.photo.attach(io: couple_photo, filename: 'photo.png', content_type: 'image/png')
couple_group.photo.attached? ? (puts "couple_group photo attached successfully") : (puts "couple_group failed to attach photo")
couple_group.save ? (puts "couple_group saved successfully") : (puts "couple_group could not save")

puts "Generating 1 active split for Couple group..."
couple_june_split = Split.new(name: "June", payment_group: couple_group)
couple_june_split.save ? (puts "Split created successfully") : (puts "Failed to create split")

puts "Generating 1 archived split for Couple group..."
archived_couple_split = Split.new(name: "May", payment_group: couple_group, active: false)
archived_couple_split.save ? (puts "Split created successfully") : (puts "Failed to create split")

puts "Generating Friends..."

firends_photo = URI.open ('https://source.unsplash.com/800x600/?friends')
friends_group = PaymentGroup.new( name: "Friends", description: "A group of friends", token: PaymentGroup.generate_unique_secure_token)
friends_group.photo.attach(io: firends_photo, filename: 'photo.png', content_type: 'image/png')
friends_group.photo.attached? ? (puts "friends_group photo attached successfully") : (puts "friends_group failed to attach photo")
friends_group.save ? (puts "friends_group saved successfully") : (puts "friends_group could not save")

puts "Generating 2 active splits for Friends group..."

bowling_split = Split.new(name: "Bowling", payment_group: friends_group)
bowling_split.save ? (puts "Split created successfully") : (puts "Failed to create split")

camping_split = Split.new(name: "Camping", payment_group: friends_group)
camping_split.save ? (puts "Split created successfully") : (puts "Failed to create split")

puts "Generating 1 archived split for Friends group..."

archived_pool_party_split = Split.new(name: "Pool Party", payment_group: friends_group, active: false)
archived_pool_party_split.save ? (puts "Split created successfully") : (puts "Failed to create split")

puts "Generating 6 users..."
puts "Login Info Pattern -> Name: Random | Email: User1@user.com | Password: User1 | -> Increment"

user_count = 1

6.times do
  puts "Initializing a user..."
  user = User.new(
    name: Faker::Name.first_name,
    email: "user#{user_count}@user.com",
    password: "password#{user_count}"
  )
  if user.save
    user_count += 1
    puts "#{user.name} created successfully."
  else
    puts "Could not save #{user.name}."
  end
  puts "Generating memberships..."
  membership = Membership.new(user: user, payment_group: user_count < 4 ? couple_group : friends_group )
  membership.save ? (puts "Membership created succesfully") : (puts "Failed to created membership")
end

puts "Generating bills for Couple/June Split..."
couple_users = User.where('id < 3')
bill_counter = 1
bill_titles = %w[Movie Groceries FamilyMart Fuel Diapers Activity Amazon Restaurant]
couple_users.each do |user|
  5.times do
    bill = Bill.new(tag: "June",
                   title: bill_titles.sample,
                   price: rand(100),
                   paid_date: rand(3.day.ago..Time.now), #ONLY APPLICABLE FOR JUNE 4 PRESENTATION
                   comment: "...",
                   user: user,
                   split: couple_june_split
                   )
    bill.save ? (puts "#{user.name}'s bill (#{bill.title}) was created successfully.") : (puts "#{user.name}'s bill (#{bill.title}) could not save.")
    bill_counter += 1
  end
end

puts "Generating bills for Couple/May Split..."

couple_users = User.where('id < 3')
bill_titles = %w[Movie Groceries FamilyMart Fuel Diapers Activity Amazon Restaurant]
bill_counter = 1
couple_users.each do |user|
  5.times do
    bill = Bill.new(tag: "May",
                   title: bill_titles.sample,
                   price: rand(100),
                   paid_date: rand(1.month.ago..5.day.ago), #ONLY APPLICABLE FOR JUNE 4 PRESENTATION
                   comment: "...",
                   user: user,
                   split: archived_couple_split
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end
puts "Generating bills for Friends/Bowling Split..."

friends_users = User.where('id >= 3')
bill_counter = 1
bill_titles = %w[Shoes Rental Fuel Food Fee Pool Beer Drinks Snacks]
friends_users.each do |user|
  4.times do
    bill = Bill.new(tag: "Bowling",
                   title: bill_titles.sample,
                   price: rand(100),
                   paid_date: 1.day.ago,
                   comment: "...",
                   user: user,
                   split: bowling_split
                   )
    bill.save ? (puts "#{user.name}'s bill (#{bill.title}) was created successfully.") : (puts "#{user.name}'s bill (#{bill.title}) could not save.")
    bill_counter += 1
  end
end

puts "Generating bills for Friends/Camping Split..."

bill_counter = 1
bill_titles = %w[Fuel Car Food Beer Chips Lures Rod Fee Fireworks]
friends_users.each do |user|
  4.times do
    bill = Bill.new(tag: "Camping",
                   title: bill_titles.sample,
                   price: rand(100),
                   paid_date: rand(3.day.ago..1.day.ago),
                   comment: "...",
                   user: user,
                   split: camping_split
                   )
    bill.save ? (puts "#{user.name}'s bill (#{bill.title}) was created successfully.") : (puts "#{user.name}'s bill (#{bill.title}) could not save.")
    bill_counter += 1
  end
end

puts "Generating bills for Friends/Archived Split..."

bill_counter = 1
bill_titles = %w[Beer Drinks BBQ Snacks Chips Candies Salad Potatoes Corn Meat]
friends_users.each do |user|
  4.times do
    bill = Bill.new(tag: "Pool Party",
                   title: bill_titles.sample,
                   price: rand(100),
                   paid_date: rand(3.day.ago..1.day.ago),
                   comment: "...",
                   user: user,
                   split: archived_pool_party_split
                   )
    bill.save ? (puts "#{user.name}'s bill (#{bill.title}) was created successfully.") : (puts "#{user.name}'s bill (#{bill.title}) could not save.")
    bill_counter += 1
  end
end
