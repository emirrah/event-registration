class Guest < ActiveRecord::Base
  belongs_to :table
  belongs_to :event
end
