defined?(ComfyPress::Application) && ComfyPress::Application.routes.draw do
  
  ComfyPress::Routing.admin(:path => '/cms-admin')
  
  # Make sure this routeset is defined last
  ComfyPress::Routing.content(:path => '/', :sitemap => false)

  ComfyPress::Routing.admin
  ComfyPress::Routing.content :sitemap => true
end
