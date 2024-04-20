class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.time :in_time
      t.time :out_time
      t.integer :qty
      t.string :refrence

      t.timestamps
    end
  end
end
