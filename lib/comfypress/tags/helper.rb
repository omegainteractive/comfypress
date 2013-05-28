class ComfyPress::Tag::Helper
  include ComfyPress::Tag
  
  BLACKLIST = %w(eval class_eval instance_eval render)
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= /[\w\-]+/
    /\{\{\s*cms:helper:(#{identifier}):?(.*?)\s*\}\}/
  end
  
  def content
    "<%= #{identifier}(#{params.collect{|p| "'#{p}'"}.join(', ')}) %>"
  end
  
  def render
    whitelist = ComfyPress.config.allowed_helpers
    if whitelist.is_a?(Array)
      content if whitelist.map!(&:to_s).member?(identifier)
    else 
      content unless BLACKLIST.member?(identifier)
    end
  end
  
end