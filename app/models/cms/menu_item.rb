class Cms::MenuItem < ActiveRecord::Base
  attr_accessible :label, :link, :menu_id, :page_id, :type
  # -- Relationships --------------------------------------------------------
  belongs_to :menu
  
  # -- Validations ----------------------------------------------------------
  validates :menu_id, 
    :presence   => true
  validates :label, 
    :presence   => true
  
end
