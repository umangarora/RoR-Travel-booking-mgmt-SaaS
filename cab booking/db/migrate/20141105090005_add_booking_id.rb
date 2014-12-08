class AddBookingId < ActiveRecord::Migration
  def change
    add_column :cabbookings, :booking_ID, :integer
  end
end
