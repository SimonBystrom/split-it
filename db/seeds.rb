require 'open-uri'

puts "You have requested seeds. Launching processes..."
# Clearing out old seeds
puts "Deleting previous seeds..."
Membership.destroy_all ? (puts "All Memberships destroyed successfully") : (puts "Could not destroy Memberships...")
Bill.destroy_all ? (puts "All Bills destroyed successfully") : (puts "Could not destroy Bills...")
User.destroy_all ? (puts "All Users destroyed successfully") : (puts "Could not destroy Users...")
Split.destroy_all ? (puts "All Splits destroyed successfully") : (puts "Could not destroy Splits...")
PaymentGroup.destroy_all ? (puts "All PaymentGroups destroyed successfully") : (puts "Could not destroy PaymentGroups...")

# Creating a 'Household' group
puts "Generating Household group..."
household_photo = URI.open ('https://source.unsplash.com/L7EwHkq1B2s/800x600')
household_group = PaymentGroup.new(name: "Household", description: "For bills and trips", token: PaymentGroup.generate_unique_secure_token)
household_group.photo.attach(io: household_photo, filename: 'photo.png', content_type: 'image/png')
household_group.photo.attached? ? (puts "household_group photo attached successfully") : (puts "household_group failed to attach photo")
household_group.save ? (puts "household_group saved successfully") : (puts "household_group could not save")

# Creating an active split 'Jun 2021' for 'Household' group
puts "Generating 1 active split for Household group..."
household_june_split = Split.new(name: "Jun 2021", payment_group: household_group)
household_june_split.save ? (puts "Split created successfully") : (puts "Failed to create split")

# Creating 6 archived splits for 'Household' group
puts "Generating 4 archived splits for Household group"
archived_household_split_may = Split.new(name: "May 2021", payment_group: household_group, active: false)
archived_household_split_may.save ? (puts "Split created successfully") : (puts "Failed to create split")
archived_household_split_mexico = Split.new(name: "Mexico", payment_group: household_group, active: false)
archived_household_split_mexico.save ? (puts "Split created successfully") : (puts "Failed to create split")
archived_household_split_apr = Split.new(name: "Apr 2021", payment_group: household_group, active: false)
archived_household_split_apr.save ? (puts "Split created successfully") : (puts "Failed to create split")
archived_household_split_thailand = Split.new(name: "Thailand", payment_group: household_group, active: false)
archived_household_split_thailand.save ? (puts "Split created successfully") : (puts "Failed to create split")
archived_household_split_mar = Split.new(name: "Mar 2021", payment_group: household_group, active: false)
archived_household_split_mar.save ? (puts "Split created successfully") : (puts "Failed to create split")
archived_household_split_feb = Split.new(name: "Feb 2021", payment_group: household_group, active: false)
archived_household_split_feb.save ? (puts "Split created successfully") : (puts "Failed to create split")

# Creating a 'The Boys' group
puts "Generating The Boys group..."
the_boys_photo = URI.open ('https://source.unsplash.com/TgK8fDRiSpA/800x600')
the_boys_group = PaymentGroup.new(name: "The Boys", description: "Bros", token: PaymentGroup.generate_unique_secure_token)
the_boys_group.photo.attach(io: the_boys_photo, filename: 'photo.png', content_type: 'image/png')
the_boys_group.photo.attached? ? (puts "the_boys_group photo attached successfully") : (puts "the_boys_group failed to attach photo")
the_boys_group.save ? (puts "the_boys_group saved successfully") : (puts "the_boys_group could not save")

# Creating 1 active split for 'The Boys' group
puts "Generating 1 active split for The Boys group"
june_camping = Split.new(name: "Tahoe", payment_group: the_boys_group)
june_camping.save ? (puts "Split created successfully") : (puts "Failed to create split")

# Creating 2 archived splits for 'The Boys' group
puts "Generating 2 archived splits for The Boys group"
archived_vegas_trip_split = Split.new(name: "Vegas", payment_group: the_boys_group, active: false)
archived_vegas_trip_split.save ? (puts "Split created successfully") : (puts "Failed to create split")
archived_skiing_big_bear_split = Split.new(name: "Big Bear", payment_group: the_boys_group, active: false)
archived_skiing_big_bear_split.save ? (puts "Split created successfully") : (puts "Failed to create split")

# Creating 6 users (Thomas, Ayane, JT, Kyle, Jeff, Mario)
puts "Generating 6 users..."
# Generating user 'Thomas'
thomas = User.new(
  name: "Thomas",
  email: "thomas@me.com",
  password: "qwerty"
  )
thomas.save ? (puts "Thomas created successfully") : (puts "Could not save Thomas")
puts "Generating memberships for Thomas..."
thomas_membership_household = Membership.new(user: thomas, payment_group: household_group)
thomas_membership_household.save ? (puts "Household membership created successfully") : (puts "Household membership failed")
thomas_membership_the_boys = Membership.new(user: thomas, payment_group: the_boys_group)
thomas_membership_the_boys.save ? (puts "The Boys membership created successfully") : (puts "The Boys membership failed")

# Generating user Ayane
ayane = User.new(
  name: "Ayane",
  email: "ayane@me.com",
  password: "qwerty"
  )
ayane.save ? (puts "Ayane created successfully") : (puts "Could not save Ayane")
puts "Generating memberships for Ayane..."
ayane_membership_household = Membership.new(user: ayane, payment_group: household_group)
ayane_membership_household.save ? (puts "Household membership created successfully") : (puts "Household membership failed")

# Generating user JT
jt = User.new(
  name: "JT",
  email: "jt@me.com",
  password: "qwerty"
  )
jt.save ? (puts "JT created successfully") : (puts "Could not save JT")
puts "Generating memberships for JT..."
jt_membership_the_boys = Membership.new(user: jt, payment_group: the_boys_group)
jt_membership_the_boys.save ? (puts "The Boys membership created successfully") : (puts "The Boys membership failed")

# Generating user Kyle
kyle = User.new(
  name: "Kyle",
  email: "kyle@me.com",
  password: "qwerty"
  )
kyle.save ? (puts "Kyle created successfully") : (puts "Could not save Kyle")
puts "Generating memberships for Kyle..."
kyle_membership_the_boys = Membership.new(user: kyle, payment_group: the_boys_group)
kyle_membership_the_boys.save ? (puts "The Boys membership created successfully") : (puts "The Boys membership failed")

# Generating user Jeff
jeff = User.new(
  name: "Jeff",
  email: "jeff@me.com",
  password: "qwerty"
  )
jeff.save ? (puts "Jeff created successfully") : (puts "Could not save Jeff")
puts "Generating memberships for Jeff..."
jeff_membership_the_boys = Membership.new(user: jeff, payment_group: the_boys_group)
jeff_membership_the_boys.save ? (puts "The Boys membership created successfully") : (puts "The Boys membership failed")

# Generating user Mario
mario = User.new(
  name: "Mario",
  email: "mario@me.com",
  password: "qwerty"
  )
mario.save ? (puts "Mario created successfully") : (puts "Could not save Mario")
puts "Generating memberships for Mario..."
mario_membership_the_boys = Membership.new(user: mario, payment_group: the_boys_group)
mario_membership_the_boys.save ? (puts "The Boys membership created successfully") : (puts "The Boys membership failed")

# puts "Generating bills for Household Feb 2021 archived split..."
household_users = User.where('id < 3')
bill_titles = %w[Internet Gas Water Rent Vons SaveMart Applebees TraderJoes WalMart Food4Less CVS ArcLight Target 7-Eleven Costco BestBuy Ross]
bill_counter = 1
start_date = Date.new(2021,02,01)
end_date = Date.new(2021,02,28)
household_users.each do |user|
  rand(4..7).times do
    bill = Bill.new(tag: "Feb 2021",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_household_split_feb
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts "Generating bills for Household Mar 2021 archived split..."
household_users = User.where('id < 3')
bill_titles = %w[Internet Gas Water Rent Vons SaveMart Applebees TraderJoes WalMart Food4Less CVS ArcLight Target 7-Eleven Costco BestBuy Ross]
bill_counter = 1
start_date = Date.new(2021,03,01)
end_date = Date.new(2021,03,31)
household_users.each do |user|
  rand(4..7).times do
    bill = Bill.new(tag: "Mar 2021",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_household_split_mar
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts "Generating bills for Household Apr 2021 archived split..."
household_users = User.where('id < 3')
bill_titles = %w[Internet Gas Water Rent Vons SaveMart Applebees TraderJoes WalMart Food4Less CVS ArcLight Target 7-Eleven Costco BestBuy Ross]
bill_counter = 1
start_date = Date.new(2021,04,01)
end_date = Date.new(2021,04,30)
household_users.each do |user|
  rand(4..7).times do
    bill = Bill.new(tag: "Apr 2021",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_household_split_apr
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts "Generating bills for Household May 2021 archived split..."
household_users = User.where('id < 3')
bill_titles = %w[Internet Gas Water Rent Vons SaveMart Applebees TraderJoes WalMart Food4Less CVS ArcLight Target 7-Eleven Costco BestBuy Ross]
bill_counter = 1
start_date = Date.new(2021,05,01)
end_date = Date.new(2021,05,31)
household_users.each do |user|
  rand(4..7).times do
    bill = Bill.new(tag: "May 2021",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_household_split_may
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts "Generating bills for Household Jun 2021 archived split..."
household_users = User.where('id < 3')
bill_titles = %w[Internet Gas Water Rent Vons SaveMart Applebees TraderJoes WalMart Food4Less CVS ArcLight Target 7-Eleven Costco BestBuy Ross]
bill_counter = 1
start_date = Date.new(2021,06,01)
end_date = Date.today
household_users.each do |user|
  rand(2..4).times do
    bill = Bill.new(tag: "Jun 2021",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: household_june_split
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts "Generating bills for Household Thailand archived split..."
household_users = User.where('id < 3')
bill_titles = %w[Food Tour Bus Train Ferry Bar Souvenir]
bill_counter = 1
start_date = Date.new(2021,04,16)
end_date = Date.new(2021,04,28)
household_users.each do |user|
  rand(3..5).times do
    bill = Bill.new(tag: "Thailand",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_household_split_thailand
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts Generating plane tickets bill for Household Thailand archived split...
household_user = User.first
bill_titles = %w[Airfare]
bill_counter = 1
start_date = Date.new(2021,04,03)
end_date = Date.new(2021,04,05)
# household_users.each do |user|
  # (4..7).times do
bill = Bill.new(tag: "Thailand",
                   title: bill_titles.sample,
               price: 2200 + rand(0.01..0.99),
               paid_date: rand(start_date..end_date),
               comment: "...",
               user: household_user,
               split: archived_household_split_thailand
               )
    bill.save ? (puts "#{household_user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{household_user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1


# puts "Generating bills for Household Mexico archived split..."
household_users = User.where('id < 3')
bill_titles = %w[Food Tour Bus Train Bar Souvenir]
bill_counter = 1
start_date = Date.new(2021,05,18)
end_date = Date.new(2021,05,26)
household_users.each do |user|
  rand(3..5).times do
    bill = Bill.new(tag: "Mexico",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_household_split_mexico
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts Generating plane tickets bill for Household Mexico archived split...
bill_titles = %w[Airfare]
bill_counter = 1
start_date = Date.new(2021,05,01)
end_date = Date.new(2021,05,02)
# household_users.each do |user|
  # (4..7).times do
bill = Bill.new(tag: "Mexico",
                   title: bill_titles.sample,
               price: 1300 + rand(0.01..0.99),
               paid_date: rand(start_date..end_date),
               comment: "...",
               user: household_user,
               split: archived_household_split_mexico
               )
    bill.save ? (puts "#{household_user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{household_user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1



# puts "Generating bills for The_Boys June Camping split..."
boys_users = User.where.not(id: 2)
bill_titles = %w[Food Walmart Fuel Fees Beer]
bill_counter = 1
start_date = Date.new(2021,06,01)
end_date = Date.new(2021,06,10)
boys_users.each do |user|
  rand(1..3).times do
    bill = Bill.new(tag: "Tahoe",
                   title: bill_titles.sample,
                   price: rand(50) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: june_camping
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts "Generating bills for The_Boys Mar Vegas split..."
boys_users = User.where.not(id: 2)
bill_titles = %w[Food Bar Fuel Hotel Beer Bellagio Caesars MGM Tickets Private Gas]
bill_counter = 1
start_date = Date.new(2021,04,17)
end_date = Date.new(2021,04,18)
boys_users.each do |user|
  rand(1..3).times do
    bill = Bill.new(tag: "Vegas",
                   title: bill_titles.sample,
                   price: rand(200) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_vegas_trip_split
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end

# puts "Generating bills for The_Boys Feb Skiing split..."
boys_users = User.where.not(id: 2)
bill_titles = %w[Food Rentals Fuel Fees Beer Gas]
bill_counter = 1
start_date = Date.new(2021,02,02)
end_date = Date.new(2021,02,07)
boys_users.each do |user|
  rand(2..4).times do
    bill = Bill.new(tag: "Big Bear",
                   title: bill_titles.sample,
                   price: rand(100) + rand(0.01..0.99),
                   paid_date: rand(start_date..end_date),
                   comment: "...",
                   user: user,
                   split: archived_skiing_big_bear_split
                   )
    bill.save ? (puts "#{user.name}'s bill ##{bill_counter} was created successfully.") : (puts "#{user.name}'s bill ##{bill_counter} could not save.")
    bill_counter += 1
  end
end
