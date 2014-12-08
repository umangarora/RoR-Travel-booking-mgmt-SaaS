class RemovebookingIdFromCabbooking < ActiveRecord::Migration
  def change
    remove_column :cabbookings, :booking_ID, :integer
  end
end
