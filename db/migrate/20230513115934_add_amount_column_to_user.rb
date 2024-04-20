class AddAmountColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :amount, :string
  end
end
