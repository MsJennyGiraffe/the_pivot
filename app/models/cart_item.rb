class CartItem < SimpleDelegator
  attr_reader :item, :quantity

  def initialize(item, quantity)
    @item = item
    @quantity = quantity
    super(@item)
  end


  def to_order_item
    OrderItem.new(item: item, quantity: quantity)
  end
end
