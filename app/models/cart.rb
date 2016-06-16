class Cart
  attr_reader :contents
  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def update_quantity(item_id, quantity)
    contents[item_id.to_s] = quantity
  end

  def cart_items
    contents.map do |item_id, quantity|
      item = Item.find(item_id)
      CartItem.new(item, quantity)
    end
  end

  def total_price
    cart_items.reduce(0) do |sum, cart_item|
      sum + cart_item.subtotal_price
    end
  end

  def total_weight
    cart_items.reduce(0) do |sum, cart_item|
      sum + cart_item.subtotal_weight
    end
  end

  def delete(item_id)
    @contents.delete(item_id)
  end

  def to_order_items
    cart_items.map(&:to_order_item)
  end
end
