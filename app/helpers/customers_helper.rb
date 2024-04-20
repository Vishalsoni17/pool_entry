module CustomersHelper
  def total_entry
    Customer.count
  end
  def total_public
    Customer.pluck(:qty).sum
  end
  def total_income
    Customer.pluck(:amount).sum
  end
  def active_public
    Customer.where(out_time: nil).pluck(:qty).sum
  end
end
