# encoding: utf-8

class Cms::MenuItem < ActiveRecord::Base
  
  ComfortableMexicanSofa.establish_connection(self)
    
  self.table_name = 'cms_menu_items'
  
  attr_accessible  :label
                  :is_published
  
  # -- Relationships --------------------------------------------------------
  belongs_to :menu
  
  # -- Callbacks ------------------------------------------------------------

  
  # -- Validations ----------------------------------------------------------
  validates :site_id, 
    :presence   => true
  validates :menu_id, 
      :presence   => true
  validates :label,
    :presence   => true
  validates :layout_id,
    :presence   => true
    
  # -- Scopes ---------------------------------------------------------------
  default_scope order('cms_menu_items.position')
  scope :published, where(:is_published => true)
  
  # -- Class Methods --------------------------------------------------------
  
  
protected
  
  
end
