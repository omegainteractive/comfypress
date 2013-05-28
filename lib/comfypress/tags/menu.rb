class ComfortableMexicanSofa::Tag::Menu
  include ComfortableMexicanSofa::Tag

  def self.regex_tag_signature(identifier = nil)
    # identifier ||= /[\w\-]+/
    # /\{\{\s*cms:menu:(#{identifier})\s*\}\}/
    identifier ||= /[\w\/\-]+/
    /\{\{\s*cms:menu:(#{identifier}):?(.*?)\s*\}\}/
  end

  def content
    # Find or initialize Cms::Menu object
    menu = page.site.menus.detect{|s| s.identifier == self.identifier.to_s}
    if menu
      "<%= render partial: 'cms_content/menu', locals: {menu_id: #{menu.id}} %>"
    end
  end

  def render
    whitelist = ComfortableMexicanSofa.config.allowed_partials
    if whitelist.is_a?(Array)
      content if whitelist.member?(identifier)
    else
      content
    end
  end
end