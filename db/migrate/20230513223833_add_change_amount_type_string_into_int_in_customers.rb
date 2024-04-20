class AddChangeAmountTypeStringIntoIntInCustomers < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :amount, :integer
  end
end
