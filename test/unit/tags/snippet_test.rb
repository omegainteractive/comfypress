require File.expand_path('../../test_helper', File.dirname(__FILE__))

class SnippetTagTest < ActiveSupport::TestCase
  
  def test_initialize_tag
    assert tag = ComfyPress::Tag::Snippet.initialize_tag(
      cms_pages(:default), '{{ cms:snippet:label }}'
    )
    assert_equal 'label', tag.identifier
    assert tag = ComfyPress::Tag::Snippet.initialize_tag(
      cms_pages(:default), '{{cms:snippet:label}}'
    )
    assert_equal 'label', tag.identifier
    assert tag = ComfyPress::Tag::Snippet.initialize_tag(
      cms_pages(:default), '{{cms:snippet:dash-label}}'
    )
    assert_equal 'dash-label', tag.identifier
  end
  
  def test_initialize_tag_failure
    [
      '{{cms:snippet}}',
      '{{cms:not_snippet:label}}',
      '{not_a_tag}'
    ].each do |tag_signature|
      assert_nil ComfyPress::Tag::Snippet.initialize_tag(
        cms_pages(:default), tag_signature
      )
    end
  end
  
  def test_content_and_render
    tag = ComfyPress::Tag::Snippet.initialize_tag(
      cms_pages(:default), '{{cms:snippet:default}}'
    )
    assert_equal 'default_snippet_content', tag.content
    assert_equal 'default_snippet_content', tag.render
    
    tag = ComfyPress::Tag::Snippet.initialize_tag(
      cms_pages(:default), "{{cms:snippet:doesnot_exist}}"
    )
    assert_equal nil, tag.content
    assert_equal '', tag.render
  end
end