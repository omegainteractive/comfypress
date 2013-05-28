defined?(ComfortableMexicanSofa::Application) && ComfortableMexicanSofa::Application.routes.draw do
  
  ComfortableMexicanSofa::Routing.admin(:path => '/cms-admin')
  
  # Make sure this routeset is defined last
  ComfortableMexicanSofa::Routing.content(:path => '/', :sitemap => false)

  ComfortableMexicanSofa::Routing.admin
  ComfortableMexicanSofa::Routing.content :sitemap => true
end
