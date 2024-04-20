json.extract! customer, :id, :name, :address, :contact, :amount, :in_time, :out_time, :qty, :refrence, :created_at, :updated_at
json.url customer_url(customer, format: :json)
