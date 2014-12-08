class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :custId
      t.string :custName
      t.string :email
      t.integer :mobile

      t.timestamps
    end
  end
end
