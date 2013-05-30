class Cms::Slide < ActiveRecord::Base

  IMAGE_MIMETYPES = %w(gif jpeg pjpeg png svg+xml tiff).collect{|subtype| "image/#{subtype}"}

  ComfyPress.establish_connection(self)

  self.table_name = 'cms_slides'

  attr_accessor :dimensions

  attr_accessible :site, :site_id,
                  :slide,
                  :file,
                  :position

  # -- Relationships --------------------------------------------------------
  belongs_to :site

  # -- Validations ----------------------------------------------------------
  validates :site_id, :presence => true
  validates_attachment_presence :file

  # -- Callbacks ------------------------------------------------------------
  before_create :assign_position

  # -- AR Extensions --------------------------------------------------------
  has_attached_file :file, ComfyPress.config.upload_file_options.merge(
    # dimensions accessor needs to be set before file assignment for this to work
    :styles => lambda { |f|
      if f.respond_to?(:instance) && f.instance.respond_to?(:dimensions)
        (f.instance.dimensions.blank?? { } : { :original => f.instance.dimensions }).merge(
          :cms_thumb => '80x60#'
        )
      end
    }
  )
  before_post_process :is_image?

  # -- Instance Methods -----------------------------------------------------
  def is_image?
    IMAGE_MIMETYPES.include?(file_content_type)
  end

protected

  def assign_position
    max = Cms::Slide.maximum(:position)
    self.position = max ? max + 1 : 0
  end
end