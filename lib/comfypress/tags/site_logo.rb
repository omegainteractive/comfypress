class ComfyPress::Tag::SiteLogo
  include ComfyPress::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= /[\w\-]+/
    /\{\{\s*cms:site_logo\s*\}\}/ # not really using identifier
  end

  def content
    "<%= render :partial => 'cms_content/site_logo' %>"
  end

  def render
    whitelist = ComfyPress.config.allowed_partials
    if whitelist.is_a?(Array)
      content if whitelist.member?(identifier)
    else
      content
    end
  end
end