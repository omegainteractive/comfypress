class ComfortableMexicanSofa::Tag::Tabs
  include ComfortableMexicanSofa::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= /[\w\-]+/
    /\{\{\s*cms:tabs:(#{identifier})\s*\}\}/ # not really using identifier
  end

  def content
    "<%= render :partial => 'cms_content/tabs' %>"
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