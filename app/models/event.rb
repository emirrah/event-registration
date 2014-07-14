class Event < ActiveRecord::Base
  has_many :guests, :dependent => :destroy
  has_many :tables, :dependent => :destroy

  validates :event_name, :num_of_tables, :max_seats, :presence => true
end
