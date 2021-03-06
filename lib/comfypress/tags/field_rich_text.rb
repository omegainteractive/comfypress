class ComfyPress::Tag::FieldRichText
  include ComfyPress::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= IDENTIFIER_REGEX
    /\{\{\s*cms:field:(#{identifier}):rich_text\s*?\}\}/
  end
  
  def content
    block.content
  end
  
  def render
    ''
  end
  
end