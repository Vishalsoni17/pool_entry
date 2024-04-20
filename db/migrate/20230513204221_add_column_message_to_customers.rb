class AddColumnMessageToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :message, :string
  end
end
