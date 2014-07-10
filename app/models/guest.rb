class Guest < ActiveRecord::Base
  belongs_to :table
  belongs_to :event
  has_many :seats
end
