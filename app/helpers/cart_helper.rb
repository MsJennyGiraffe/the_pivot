module CartHelper
  include ActionView::Helpers::UrlHelper
  def item_removed_from_cart(item)
     view_context.link_to item.title, item_path(item)
  end

  def quantity_range(item)
    range = (1..20)
    range = (1..item.stock) if item.stock < 20
    range
  end
end
