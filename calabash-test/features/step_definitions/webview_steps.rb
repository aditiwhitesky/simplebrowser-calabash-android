Then(/^I wait to see webview element with id "(.*?)"$/) do |id|
  wait_for_elements_exist("all webview css:'##{id}'", :timeout => 5)
end

Then(/^I should see webview text "(.*?)" in element with id "(.*?)"$/) do |text, id|
  step "I wait for 5 seconds"
	if query("all webview css:'##{id}' {textContent CONTAINS '#{text}'}").empty?
    raise "Element not found with text \"#{text}\""
  end
end

Then(/^I enter text "(.*?)" into webview input field with id "(.*?)"$/) do |text, id|
  elementQuery = "all webview css:'input[id=\"#{id}\"]'"
  wait_for_elements_exist( [elementQuery], :timeout => 2)

  js = "javascript:ele = document.getElementById('#{id}'); ele.scrollIntoView(); ele.focus();"
  query('webview', :loadUrl => js)
  touch(elementQuery)
  keyboard_enter_text(text)
end

Then (/^I touch the button in webview with id "(.*?)"$/) do |id|
  elementQuery = "all webview css:'button[id=\"#{id}\"]'"
  wait_for_elements_exist( [elementQuery], :timeout => 2)
  touch(elementQuery)
end
