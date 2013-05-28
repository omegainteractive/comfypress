# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'comfypress/version'

Gem::Specification.new do |s|
  s.name          = "comfypress"
  s.version       = ComfyPress::VERSION
  s.authors       = ["Nayeem Syed", "Omega Interactive Ltd"]
  s.email         = ["developerinlondon@gmail.com"]
  s.homepage      = "http://github.com/omegainteractive/comfypress"
  s.summary       = "CMS Engine for Rails 3 apps (Based on ComfortableMexicanSofa)"
  s.description   = "ComfyPress is a powerful CMS Engine for Ruby on Rails 3 applications"
  
  s.files         = `git ls-files`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  
  s.add_dependency 'rails',          '>= 3.1.0'
  s.add_dependency 'formatted_form', '>= 2.1.0'
  s.add_dependency 'active_link_to', '>= 1.0.0'
  s.add_dependency 'paperclip',      '>= 3.4.0'
  s.add_dependency 'redcarpet',      '>= 2.2.0'
  s.add_dependency 'jquery-rails',   '>= 2.1.4'
  s.add_dependency 'haml-rails',     '>= 0.3.0'
  s.add_dependency 'sass-rails',     '>= 3.1.0'
  s.add_dependency 'coffee-rails',   '>= 3.1.0'
end
