class ComfyPress::Tag::FieldInteger
  include ComfyPress::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= IDENTIFIER_REGEX
    /\{\{\s*cms:field:(#{identifier}):integer\s*\}\}/
  end
  
  def content
    block.content
  end
  
  def render
    ''
  end
  
end