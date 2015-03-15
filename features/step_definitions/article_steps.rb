Given /^the following articles exist:$/ do |table|
  table.hashes.each do |article|
    c = Article.create(title: article[:title], author: article[:author], body: article[:body], type: article[:type])
    puts c.id, c.title, c.author, c.body, c.type
  end
end

Given /^the following comments exist:$/ do |comments|
  comments.hashes.each do |comment|
    c = Comment.new(title: comment[:title], author: comment[:author], body: comment[:body], type: comment[:type], article_id: comment[:article_id])
    puts c.save(validate: false)
    puts c.id, c.title, c.article_id
  end
end

Given /^I am on the admin edit page for "(.*)"$/ do |arg1|
    c = Article.find_by_title(arg1)
    puts "article found: ", c
    puts "all articles: ", Article.all
    visit "admin/content/edit/#{c.id}"
end

Given /^I merge this article with: (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should be reading the "(.*?)" article$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the author should be "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the words: "(.*?)", "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given /^I am not an admin$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not see the "(.*?)" button$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end