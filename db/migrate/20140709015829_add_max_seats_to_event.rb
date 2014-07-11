class AddMaxSeatsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :max_seats, :integer, :default => 8
  end
end
