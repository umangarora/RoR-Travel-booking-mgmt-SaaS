class CreateCardTransfers < ActiveRecord::Migration
  def change
    create_table :card_transfers do |t|
      t.string :card_number
      t.string :cvv
      t.date :expiry
      t.string :name_on_card
      t.boolean :PaymentOptionCheckbox

      t.timestamps
    end
  end
end
