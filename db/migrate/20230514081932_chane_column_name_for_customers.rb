class ChaneColumnNameForCustomers < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :out_at , :entry_date
  end
end
