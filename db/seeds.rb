# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# event1 = Event.create :event_name => "Coming ONE soon."
# event2 = Event.create :event_name => "Coming TWO soon."
# event3 = Event.create :event_name => "Coming THREE soon."

# table1 = Table.create :max_seats => 6, :table_number => 'A1', :event => event1
# table2 = Table.create :max_seats => 6, :table_number => 'A2', :event => event1
# table3 = Table.create :max_seats => 6, :table_number => 'B1', :event => event2
# table4 = Table.create :max_seats => 6, :table_number => 'B2', :event => event2
# table5= Table.create :max_seats => 6, :table_number => 'C1', :event => event3

# guest1 = Guest.create :event => event1, :table => table1
# guest2 = Guest.create :event => event1, :table => table1
# guest3 = Guest.create :event => event2, :table => table2
# guest4 = Guest.create :event => event2, :table => table3
# guest5 = Guest.create :event => event3, :table => table4
# guest6 = Guest.create :event => event3, :table => table5

# seat1 = Seat.create :occupied => true, :guest => guest1, :table => table1
# seat2 = Seat.create :occupied => true, :guest => guest1, :table => table1
# seat3 = Seat.create :occupied => true, :guest => guest1, :table => table2
# seat4 = Seat.create :occupied => true, :guest => guest1, :table => table3
# seat5 = Seat.create :occupied => true, :guest => guest1, :table => table4
# seat6 = Seat.create :occupied => true, :guest => guest1, :table => table5
