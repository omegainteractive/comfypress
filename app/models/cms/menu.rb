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
  
end
