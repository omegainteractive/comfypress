module ApplicationHelper
  def link_to_menu_item(menu_item)
    if 'link' == menu_item.menu_item_type
      link = link_to(menu_item.label, menu_item.link)
    else
      if menu_item.page_id
        page = Cms::Page.find(menu_item.page_id)
        link = link_to(menu_item.label, page.url)
      else
        ComfyPress.logger.warn('Page is not selected for menu item.')
      end
    end

    link
  end
end
