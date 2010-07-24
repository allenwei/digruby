Then /^(:?|It ) should have "([^\"]*)" articles$/ do |count| 
  page.has_css? "#articles.selector", :count => 5
end

When /^(:?|I )press next page$/ do 
  click_button("more_button")
end
