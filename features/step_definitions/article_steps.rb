Given /^I am at the edit page for "(.*)"$/ do |name|
  article = Article.where(:title => name).first
  id = article.id
  visit "admin/content/edit/#{id}"
end

Given /^the user "(.*)" exists$/ do |name|
  user = User.create({:login => '#{name}',
                :password => 'aaaaaaaa',
                :email => 'john@snow.com',
                :profile_id => 2,
                :name => '#{name}',
                :state => 'active'})
  user.save!
end

Given /^I am logged in as (.*)$/ do |name|
  if name == "an administrator"
    name = "admin"
  end
  visit '/accounts/logout'
  fill_in 'user_login', :with => '#{name}'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

When /^the following article exists: title: "(.*)", author: "(.*)", text: "(.*)"$/ do |title, author, text|
  article = Article.get_or_build_article(nil)
  article.title = title
  article.author = author
  article.body = text
  article.save!
end

When /^I merge "(.*)" with "(.*)"$/ do |name1, name2|
  article1 = Article.where(:title => name1).first
  name = article1.title
  step "I am at the edit page for \"#{name}\""
  article2 = Article.where(:title => name2).first
  if article2 == nil
    id = 1000000000
  else
    id = article2.id
  end
  fill_in 'merge_with', :with => "#{id}"
  step "I press \"Merge\""
end

When /^I visit the page for "(.*)"$/ do |name|
  article = Article.where(:title => name).first
  day = article.day_url
  month = article.month_url
  year = article.year_url
  visit "/#{year}/#{month}/#{day}/#{name}"
end

When /^the article "(.*)" has the following comment: "(.*)"$/ do |name, comment|
  article = Article.where(:title => name).first
  article.comment.create!(:author => "admin", :body => comment)
  #step "I visit the page for \"#{name}\""
  #fill_in "comment_author", :with => "admin"
  #fill_in "comment_email", :with => "john@snow.com"
  #fill_in "comment_url", :with => "localhost:3000"
  #fill_in "comment_body", :with => comment
  #step "I press \"comment\""
end

When /^I cause a problem$/ do
  step "I go to the content page"
  step "the article \"one\" has the following comment: \"this will fail\""
end
