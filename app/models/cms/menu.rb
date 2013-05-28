class Cms::Menu < ActiveRecord::Base
  
  attr_accessible :label, :site_id
  
  # -- Relationships --------------------------------------------------------
  belongs_to :site
  has_many :menu_items,
    :autosave   => true,
    :dependent  => :destroy
    
  # -- Validations ----------------------------------------------------------
  validates :site_id, 
    :presence   => true
  validates :label, 
    :presence   => true
    
  # -- Class Methods --------------------------------------------------------
    def self.options_for_select(site)
      out = []
      site.menus.each do |amenu|
        out << [ "#{amenu.label}", amenu.id ]
      end
      return out.compact
    end
    
end
