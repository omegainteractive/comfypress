require File.expand_path('../../test_helper', File.dirname(__FILE__))

class PageDateTimeTagTest < ActiveSupport::TestCase
  
  def test_initialize_tag
    assert tag = ComfyPress::Tag::PageDateTime.initialize_tag(
      cms_pages(:default), '{{ cms:page:content:datetime }}'
    )
    assert_equal 'content', tag.identifier
    assert_nil tag.namespace
    assert tag = ComfyPress::Tag::PageDateTime.initialize_tag(
      cms_pages(:default), '{{cms:page:content:datetime}}'
    )
    assert_equal 'content', tag.identifier
    assert tag = ComfyPress::Tag::PageDateTime.initialize_tag(
      cms_pages(:default), '{{cms:page:dash-content:datetime}}'
    )
    assert_equal 'dash-content', tag.identifier
    assert tag = ComfyPress::Tag::PageDateTime.initialize_tag(
      cms_pages(:default), '{{cms:page:namespace.content:datetime}}'
    )
    assert_equal 'namespace.content', tag.identifier
    assert_equal 'namespace', tag.namespace
  end
  
  def test_initialize_tag_failure
    [
      '{{cms:page:content:not_datetime}}',
      '{{cms:page:content}}',
      '{{cms:not_page:content}}',
      '{not_a_tag}'
    ].each do |tag_signature|
      assert_nil ComfyPress::Tag::PageDateTime.initialize_tag(
        cms_pages(:default), tag_signature
      )
    end
  end
  
  def test_content_and_render
    tag = ComfyPress::Tag::PageDateTime.initialize_tag(
      cms_pages(:default), '{{cms:page:content:datetime}}'
    )
    assert tag.block.content.blank?
    time = 2.days.ago
    tag.block.content = time
    assert_equal time, tag.content
    assert_equal time.to_s, tag.render
  end
  
end