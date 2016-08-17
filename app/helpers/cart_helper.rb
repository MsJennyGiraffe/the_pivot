module CartHelper
  include ActionView::Helpers::UrlHelper
  def item_removed_from_cart(item)
     view_context.link_to item.title, item_path(item)
  end
end
