class Cms::Tab < ActiveRecord::Base
  ComfyPress.establish_connection(self)

  self.table_name = 'cms_tabs'

  attr_accessible :label, :content

  belongs_to :site
end