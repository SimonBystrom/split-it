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

User.destroy_all ? (puts "All Users destroyed successfully") : (puts "Could not destroy Users...")
PaymentGroup.destroy_all ? (puts "All PaymentGroups destroyed successfully") : (puts "Could not destroy PaymentGroups...")
Split.destroy_all ? (puts "All Splits destroyed successfully") : (puts "Could not destroy Splits...")
Bill.destroy_all ? (puts "All Bills destroyed successfully") : (puts "Could not destroy Bills...")

puts "Generating group 1(couple)..."

photo1 = URI.open ('https://source.unsplash.com/800x600/?couple')
group1 = PaymentGroup.new( name: "Couple", description: "A household group" )
group1.photo.attach(io: photo1, filename: 'photo.png', content_type: 'image/png')
group1.photo.attached? ? (puts "Group1 photo attached successfully") : (puts "Group1 failed to attach photo")
group1.save ? (puts "Group1 saved successfully") : (puts "Group1 could not save")

puts "Generating 1 split for group 1..."
split1 = Split.new(name: "June", payment_group: group1)
split1.save ? (puts "Split created successfully") : (puts "Failed to create split")

puts "Generating group 2(Friends)..."

photo2 = URI.open ('https://source.unsplash.com/800x600/?friends')
group2 = PaymentGroup.new( name: "Friends", description: "A group of friends")
group2.photo.attach(io: photo2, filename: 'photo.png', content_type: 'image/png')
group2.photo.attached? ? (puts "Group2 photo attached successfully") : (puts "Group2 failed to attach photo")
group2.save ? (puts "Group2 saved successfully") : (puts "Group2 could not save")

puts "Generating 2 splits for group 2..."

split2 = Split.new(name: "Bowling", payment_group: group2)
split2.save ? (puts "Split created successfully") : (puts "Failed to create split")

split3 = Split.new(name: "Camping", payment_group: group2)
split3.save ? (puts "Split created successfully") : (puts "Failed to create split")

puts "Generating 6 users..."
puts "Login Info Pattern -> Name: User1 | Email: User1@user.com | Password: User1 | -> Increment"

user_count = 1

6.times do 
  puts "Initializing a user..."
  user = User.new(
    name: FAKER::Name.first_name, 
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
  membership = Membership.new(user: user, payment_group: user_count < 4 ? group1 : group2 )
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
                   paid_date: rand(1.month.ago..5.day.ago),
                   comment: "...",
                   user: user,
                   split: split1
                   )
    bill.save ? (puts "#{user.name}'s bill (#{bill.title}) was created successfully.") : (puts "#{user.name}'s bill (#{bill.title}) could not save.")
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
                   split: split2
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
                   split: split2
                   )
    bill.save ? (puts "#{user.name}'s bill (#{bill.title}) was created successfully.") : (puts "#{user.name}'s bill (#{bill.title}) could not save.")
    bill_counter += 1
  end
end
