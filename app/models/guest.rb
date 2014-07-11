class Guest < ActiveRecord::Base
  # belongs_to :table
  belongs_to :event
  has_many :seats

  validates :num_of_seats, :name, :presence => true
end
