Given /^the following articles exist:$/ do |table|
  table.hashes.each do |article|
    c = Article.create(title: article[:title], author: article[:author], body: article[:body], type: article[:type])
  end
end

Given /^the following comments exist:$/ do |comments|
  comments.hashes.each do |comment|
    c = Comment.new(title: comment[:title], author: comment[:author], body: comment[:body], type: comment[:type], article_id: comment[:article_id])
    c.save(:validate => false)
  end
end

Given /^I am on the admin edit page for "(.*)"$/ do |arg1|
    c = Article.find_by_title(arg1)
    visit "admin/content/edit/#{c.id}"
end

And /^I merge this article with: "(.*?)"$/ do |arg1|
  article_to_merge = Article.find_by_title(arg1)
  click_button("Merge")
end

Then /^I should be reading the article "(.*?)"$/ do |arg1|
  expect(page).to have_content arg1
end

Then /^the author should be "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

And /^the title should be "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should see the words: "(.*?)", "(.*?)"$/ do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end

Then /^I should not see the "(.*?)" button$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^the blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'admin',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 1,
                :name => 'admin',
                :state => 'active'})
  User.create!({:login => 'publisher',
               :password => 'bbbbbb',
               :email => 'swiggle@swaggles.com',
               :profile_id => 1,
               :name => 'publisher',
               :state => 'active'})
  puts "blog has been set up"
end

Given /^I am not an admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'publisher'
  fill_in 'user_password', :with => 'bbbbbb'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Then(/^the article "(.*?)" should have the comment "(.*?)"$/) do |arg1, arg2|
  a = Article.find_by_title("arg1")
  c = Comment.find_by_title("arg2")
  assert c.article_id == a.id
end
