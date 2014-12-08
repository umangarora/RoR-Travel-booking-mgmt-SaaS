class CreateAirlinebookings < ActiveRecord::Migration
  def change
    create_table :airlinebookings do |t|
    	t.integer :Cust_ID
      t.integer :booking_ID
      t.integer :date
      t.string :Source
      t.string :Destination
      t.timestamps
    end
  end
end
