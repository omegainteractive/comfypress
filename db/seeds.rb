# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Cms::Site.create(:id => 1, :label => 'localhost', :identifier => 'localhost', :hostname => 'localhost:3000');
Cms::Site.create(:id => 2, :label => 'myimathstesting', :identifier => 'myimathstesting', :hostname => 'myimathstesting.com:3000');

Cms::Layout.create(:id => 1, :site_id => 1, :label => 'application', :identifier => 'application_localhost', 
  :content => '<html><body>
    <div class="header">
      {{ cms:snippet:header }}
      {{ cms:snippet:login_form }}
    </div>
    <div class="content">
      <h1> {{ cms:page:title:string }} </h1>
      {{ cms:page:content:rich_text }}
    </div>
    <div class="footer">
      {{ cms:snippet:footer }}
    </div>
  </body></html>');
Cms::Layout.create(:id => 2, :site_id => 1, :label => 'index', :identifier => 'index_localhost', 
  :content => '<div class="header">
  {{ cms:snippet:header }}
  {{ cms:snippet:login_form }}
</div>
<div class="content">
  {{ cms:page:content }}
</div>
<div class="footer">
  {{ cms:snippet:footer }}
</div> ');

Cms::Page.create({:id => 1, :site_id => 1, :layout_id => 2, :label => 'root', :full_path => '/',
  :content => '<div class="header">
  [header snippet text]
  
</div>
<div class="content">
  root
</div>
<div class="footer">
  [footer goes here]
</div>', :children_count => 3, :is_published => 1, :is_shared => 0}, :without_protection => true);

Cms::Page.create({:id => 2, :site_id => 1, :layout_id => 2, :label => 'index-cms',:slug => 'index-cms', :full_path => '/index-cms',
  :content => '<div class="header">
  [header snippet text]
  
</div>
<div class="content">
  [index content]
</div>
<div class="footer">
  [footer goes here]
</div>', :children_count => 0, :is_published => 1, :is_shared => 0}, :without_protection => true);

Cms::Page.create({:id => 3, :site_id => 1, :layout_id => 1, :label => 'about',:slug => 'about', :full_path => '/about',
  :content => '<html>
  <body>
    <div class="header">
      [header snippet text]
      
    </div>
    <div class="content">
      <h1> about title </h1>
      [about content]
    </div>
    <div class="footer">
      [footer goes here]
    </div>
  </body>
<html>', :children_count => 0, :is_published => 1, :is_shared => 0}, :without_protection => true);

Cms::Page.create({:id => 4, :site_id => 1, :layout_id => 1, :label => 'contact',:slug => 'contact', :full_path => '/contact',
  :content => '<html>
  <body>
    <div class="header">
      [header snippet text]
      
    </div>
    <div class="content">
      <h1> contact us </h1>
      [contact us]
    </div>
    <div class="footer">
      [footer goes here]
    </div>
  </body>
<html>', :children_count => 0, :is_published => 1, :is_shared => 0}, :without_protection => true);

Cms::Snippet.create({:id => 1, :site_id => 1, :label => 'header', :identifier => 'header', 
  :content => '[header snippet goes here]', :is_shared => 1}, :without_protection => true);
Cms::Snippet.create({:id => 2, :site_id => 1, :label => 'footer', :identifier => 'footer', 
  :content => '[footer snippet goes here]', :is_shared => 1}, :without_protection => true);  
Cms::Snippet.create({:id => 3, :site_id => 1, :label => 'login_form', :identifier => 'login-form', 
  :content => '<form accept-charset="UTF-8" action="/assessment/auth" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="xMIBxhWewms1jYJaeV51NIcwrLq7s9IPxWmk9ONasnY="></div>
          <fieldset class="login">
            <input autocomplete="off" id="user_user_name" name="user[user_name]" placeholder="Username" size="30" type="text">
            <input autocomplete="off" id="user_password" name="user[password]" placeholder="Password" size="30" type="password">
            <input class="btn btn-mymaths" name="commit" type="submit" value="Login">
            <a href="#">
              <div class="question-button">
                <span>?</span>
              </div>
            </a>
          </fieldset>
</form>', :is_shared => 1}, :without_protection => true);  


Cms::Category.create({:id => 1, :site_id => 1, :label => 'carousel', :categorized_type => 'Cms::File'}, :without_protection => true);
Cms::Category.create({:id => 2, :site_id => 1, :label => 'carousel', :categorized_type => 'Cms::Page'}, :without_protection => true);
Cms::Category.create({:id => 3, :site_id => 1, :label => 'carousel', :categorized_type => 'Cms::Snippet'}, :without_protection => true);
Cms::Categorization.create({:id => 1, :category_id => 2, :categorized_type => 'Cms::File', :categorized_id => 1}, :without_protection => true);
Cms::Categorization.create({:id => 2, :category_id => 2, :categorized_type => 'Cms::File', :categorized_id => 2}, :without_protection => true);

Cms::Block.create({:id => 1, :page_id => 1, :identifier => 'content', :content => 'root'}, :without_protection => true);
Cms::Block.create({:id => 2, :page_id => 2, :identifier => 'content', :content => '[index content]'}, :without_protection => true);
Cms::Block.create({:id => 3, :page_id => 3, :identifier => 'title', :content => 'about title'}, :without_protection => true);
Cms::Block.create({:id => 4, :page_id => 3, :identifier => 'content', :content => '[about content]'}, :without_protection => true);
Cms::Block.create({:id => 5, :page_id => 4, :identifier => 'title', :content => 'contact us'}, :without_protection => true);
Cms::Block.create({:id => 6, :page_id => 4, :identifier => 'content', :content => '[contact us]'}, :without_protection => true);
