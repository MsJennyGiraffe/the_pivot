class CartItem < SimpleDelegator
  attr_reader :item, :quantity

  def initialize(item, quantity)
    @item = item
    @quantity = quantity
    super(@item)
  end

  def subtotal_price
    item.price * quantity.to_i
  end

  def subtotal_weight
    item.weight * quantity.to_i
  end
end
