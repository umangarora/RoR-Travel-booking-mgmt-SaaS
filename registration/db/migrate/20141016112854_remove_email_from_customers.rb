class RemoveEmailFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :email, :string
  end
end
