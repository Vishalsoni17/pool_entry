class RemoveColumnEntryDateForCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :entry_date
  end
end
