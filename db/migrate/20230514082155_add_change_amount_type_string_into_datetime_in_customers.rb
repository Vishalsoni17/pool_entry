class AddChangeAmountTypeStringIntoDatetimeInCustomers < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :entry_date, :datetime
  end
end
