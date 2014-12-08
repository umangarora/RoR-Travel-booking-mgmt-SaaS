class CreateCabbooking < ActiveRecord::Migration
  def change
    create_table :cabbookings do |t|
      t.integer :Cust_ID
      t.integer :booking_ID
      t.integer :pickup
      t.string :Source
      t.string :Destination

      t.timestamps
    end
  end
end
