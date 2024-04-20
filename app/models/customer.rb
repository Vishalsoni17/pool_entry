class Customer < ApplicationRecord
  validates :name, :contact, :qty, :address, presence: true
  
  before_create :set_in_time
  before_save :set_amount

  def set_in_time
    self.in_time = Time.now + 5.hour + 30.minute if self.in_time.nil?
  end

  def set_amount
    # binding.pry
    self.amount = self.qty*50
  end

  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("name LIKE ? OR contact LIKE ?", "%#{search}%", "%#{search}%")
  end
end
