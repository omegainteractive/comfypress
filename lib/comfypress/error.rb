module ComfyPress
  
  class Error < StandardError
  end
  
  class MissingSite < ComfyPress::Error
    def initialize(identifier)
      super "Cannot find CMS Site with identifier: #{identifier}"
    end
  end
  
  class MissingLayout < ComfyPress::Error
    def initialize(identifier)
      super "Cannot find CMS Layout with identifier: #{identifier}"
    end
  end
  
  class MissingPage < ComfyPress::Error
    def initialize(path)
      super "Cannot find CMS Page at #{path}"
    end
  end
  
end