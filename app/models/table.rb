class Table < ActiveRecord::Base
  belongs_to :event
  has_many :seats, :dependent => :destroy
end
