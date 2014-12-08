class CreateAccountTransfers < ActiveRecord::Migration
  def change
    create_table :account_transfers do |t|
      t.boolean :PaymentOptionCheckbox
      t.string :AccountID
      t.string :CustBankID

      

      t.timestamps
    end
  end
end
