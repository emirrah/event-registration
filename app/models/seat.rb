class Seat < ActiveRecord::Base
  belongs_to :table
  belongs_to :guest
end
