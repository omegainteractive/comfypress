# encoding: utf-8

class Cms::Menu < ActiveRecord::Base
  
  ComfortableMexicanSofa.establish_connection(self)
    
  self.table_name = 'cms_menus'
  
  attr_accessible 
                  :label,
                  :is_published
  
  # -- Relationships --------------------------------------------------------
  belongs_to :site
  belongs_to :layout
  
  has_many :menu_items, :dependent => :destroy
  # -- Callbacks ------------------------------------------------------------

  
  # -- Validations ----------------------------------------------------------
  validates :site_id, 
    :presence   => true
  validates :label,
    :presence   => true
  validates :layout_id,
    :presence   => true
    
  # -- Scopes ---------------------------------------------------------------
  default_scope order('cms_menus.position')
  scope :published, where(:is_published => true)
  
  # -- Class Methods --------------------------------------------------------
  
  
protected
  
  
end
