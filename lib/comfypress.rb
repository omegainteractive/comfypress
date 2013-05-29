# Loading engine only if this is not a standalone installation
unless defined? ComfyPress::Application
  require File.expand_path('comfypress/engine', File.dirname(__FILE__))
end

[ 'comfypress/version',
  'comfypress/error',
  'comfypress/configuration',
  'comfypress/routing',
  'comfypress/authentication/http_auth',
  'comfypress/authentication/dummy_auth',
  'comfypress/render_methods',
  'comfypress/view_hooks',
  'comfypress/view_methods',
  'comfypress/form_builder',
  'comfypress/tag',
  'comfypress/sitemap',
  'comfypress/fixtures',
  'comfypress/extensions/rails',
  'comfypress/extensions/acts_as_tree',
  'comfypress/extensions/has_revisions',
  'comfypress/extensions/is_mirrored',
  'comfypress/extensions/is_categorized'
].each do |path|
  require File.expand_path(path, File.dirname(__FILE__))
end

Dir.glob(File.expand_path('comfypress/tags/*.rb', File.dirname(__FILE__))).each do |path|
  require path
end

module ComfyPress
  class << self
    
    # Modify CMS configuration
    # Example:
    #   ComfyPress.configure do |config|
    #     config.cms_title = 'ComfyPress'
    #   end
    def configure
      yield configuration
    end
    
    # Accessor for ComfyPress::Configuration
    def configuration
      @configuration ||= Configuration.new
    end
    alias :config :configuration
    
    # Establishing database connection if custom one is defined
    def establish_connection(klass)
      if ComfyPress.config.database_config && !Rails.env.test?
        klass.establish_connection "#{ComfyPress.config.database_config}_#{Rails.env}"
      end
    end

    def logger=(new_logger)
      @logger = new_logger
    end

    def logger
      @logger ||= Rails.logger
    end
    
  end
end
