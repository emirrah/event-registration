class AddNumOfTablesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :num_of_tables, :integer, :default => 20
  end
end
