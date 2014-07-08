class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :max_seats
      t.string :table_number
      t.references :event, index: true

      t.timestamps
    end
  end
end
