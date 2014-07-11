class Event < ActiveRecord::Base
  has_many :guests
  has_many :tables

  validates :event_name, :num_of_tables, :max_seats, :presence => true
end
