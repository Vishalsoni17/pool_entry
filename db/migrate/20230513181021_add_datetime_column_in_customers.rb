class AddDatetimeColumnInCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :out_at, :time
  end
end
