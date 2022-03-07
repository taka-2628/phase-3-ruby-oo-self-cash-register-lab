class CashRegister
  attr_accessor :total, :discount, :last_transaction, :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.last_transaction = price * quantity
    self.total += last_transaction
    quantity.times{self.items << title}
  end

  def apply_discount
    if self.discount != 0
      discounted = (100.0 - self.discount) / 100.0
      self.total = (self.total * discounted).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
