class ComfyPress::Tag::PageDateTime
  include ComfyPress::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= IDENTIFIER_REGEX
    /\{\{\s*cms:page:(#{identifier}):datetime\s*\}\}/
  end
  
  def content
    block.content
  end
  
end