Given /^I am on the edit page for "(.*)"^/ do
  article = ActiveRecord.find_by_title("$1")
  step "I go to /admin/content/edit/#{article.id}"
end
