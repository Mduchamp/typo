Given /^I am at the edit page for the article "(.*)"$/ do |name|
  article = Article.where(:title => name).first
  id = article.id
  visit "admin/content/edit/#{id}"
end

Given /^The user "(.*)" exists$/ do |name|
  User.create!({:login => '#{name}',
                :password => 'aaaaaaaa',
                :email => 'john@snow.com',
                :profile_id => 1,
                :name => '#{name}',
                :state => 'active'})
end

Given /^I am logged in as (.*)$/ do |name|
  if name == "an administrator"
    name = "admin"
  end
  visit '/accounts/login'
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
  Article.create!({:title => '#{title}', :author => '#{author}', :body => '#{text}'})
end

When /^I merge it with "(.*)"$/ do
  name = $1
  article = ActiveRecord.find_by_title("#{name}")
  fill_in 'merge_with', :with => '#{article.id}'
  step "I press \"Merge\""
end
