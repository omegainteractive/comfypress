# ComfyPress (Rails 3 CMS Engine)
[![Gem Version](https://badge.fury.io/rb/comfypress.png)](http://rubygems.org/gems/comfypress) [![Build Status](https://travis-ci.org/omegainteractive/comfypress.png?branch=master)](https://travis-ci.org/omegainteractive/comfypress) [![Dependency Status](https://gemnasium.com/omegainteractive/comfypress.png)](https://gemnasium.com/omegainteractive/comfypress) [![Code Climate](https://codeclimate.com/github/omegainteractive/comfypress.png)](https://codeclimate.com/github/omegainteractive/comfypress) [![Coverage Status](https://coveralls.io/repos/omegainteractive/comfypress/badge.png?branch=master)](https://coveralls.io/r/omegainteractive/comfypress)

ComfyPress is a powerful CMS Engine for your Rails 3 applications.

Features
--------
* Simple integration with Rails 3 apps. Supports Rails 3.1, 3.2 running Ruby 1.9.2, 1.9.3 or 2.0.0
* Build your application in Rails, not in CMS
* Powerful page templating capability using [Tags](https://github.com/omegainteractive/comfypress/wiki/Tags)
* [Multiple Sites](https://github.com/omegainteractive/comfypress/wiki/Sites) from a single installation
* Multilingual
* [Fixtures](https://github.com/omegainteractive/comfypress/wiki/Working-with-CMS-fixtures) for initial content population
* [Revision History](https://github.com/omegainteractive/comfypress/wiki/Revisions)
* [Great extendable admin interface](https://github.com/omegainteractive/comfypress/wiki/Reusing-sofa%27s-admin-area) built with [Bootstrap](http://twitter.github.com/bootstrap/), [CodeMirror](http://codemirror.net/) and [WYSIHTML5](http://xing.github.com/wysihtml5/)

Installation for Rails 4
------------------------
For Rails 4 apps feel free to use [2.0.0.beta1](https://github.com/omegainteractive/comfypress/tree/2.0) release.

    gem 'comfypress', '~2.0.0.beta1'

Installation
------------
Add gem definition to your Gemfile:
    
    gem 'comfypress'
    
Then from the Rails project's root run:
    
    bundle install
    rails generate comfy:cms
    rake db:migrate
    
Now take a look inside your `config/routes.rb` file. You'll see where routes attach for the admin area and content serving. Make sure that content serving route appears as a very last item.

```ruby
ComfyPress::Routing.admin   :path => '/cms-admin'
ComfyPress::Routing.content :path => '/', :sitemap => false
```

When upgrading from the older version please take a look at [Upgrading ComfyPress](https://github.com/omegainteractive/comfypress/wiki/Upgrading-ComfyPress)
    
Quick Start Guide
-----------------
After finishing installation you should be able to navigate to http://yoursite/cms-admin

Default username and password is 'username' and 'password'. You probably want to change it right away. Admin credentials (among other things) can be found and changed in the cms initializer: [/config/initializers/comfypress.rb](https://github.com/omegainteractive/comfypress/blob/master/config/initializers/comfypress.rb)

Before creating pages and populating them with content we need to create a Site. Site defines a hostname, content path and it's language.

After creating a Site, you need to make a Layout. Layout is the template of your pages; it defines some reusable content (like header and footer, for example) and places where the content goes. A very simple layout can look like this:
    
```html
<html>
  <body>
    <h1>{{ cms:page:header:string }}</h1>
    {{ cms:page:content:text }}
  </body>
</html>
```

Once you have a layout, you may start creating pages and populating content. It's that easy.

For more information please [see Wiki pages](https://github.com/omegainteractive/comfypress/wiki).

![Sofa's Page Edit View](https://github.com/omegainteractive/comfypress/raw/master/doc/preview.png)

Help and Contact
----------------

GoogleGroups: http://groups.google.com/group/comfypress
Twitter: [@nayeems](http://twitter.com/#!/nayeems)

---

ComfyPress is released under the [MIT license](https://github.com/omegainteractive/comfypress/raw/master/LICENSE) 

Copyright 2013 Nayeem Syed, [Omega Interactive Ltd](http://www.omegainteractive.co.uk)