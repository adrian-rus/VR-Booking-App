class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :time
      t.integer :duration
      t.text :description
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
