class RemoveColumnEntryAtForCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :entry_at
  end
end
