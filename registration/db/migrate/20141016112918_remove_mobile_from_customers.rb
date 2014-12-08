class RemoveMobileFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :mobile, :integer
  end
end
