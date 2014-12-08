class CreateTravelagents < ActiveRecord::Migration
  def change
    create_table :travelagents do |t|
      t.integer :agentId
      t.string :agentName
      t.string :password
      t.string :hashed_password
      t.string :email
      t.integer :mobile
      t.boolean :cabset
      t.boolean :railset
      t.boolean :airset

      t.timestamps
    end
  end
end
