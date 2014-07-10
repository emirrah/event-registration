class AddNumOfSeatsToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :num_of_seats, :integer
  end
end
