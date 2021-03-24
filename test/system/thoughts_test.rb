require "application_system_test_case"

class ThoughtsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit thoughts_url
  #
  #   assert_selector "h1", text: "Thoughts"
  # end

  test "create a thought" do
    visit conversations_path
  
    click_on "New conversation"
  
    fill_in "Title", with: "Hello World"
  
    click_on "Create Conversation"
  
    fill_in "Message", with: "This is a message"

    click_on "Create Message"

    fill_in "Thought", with: "This is a thought"

    click_on "Create Thought"

    assert_text "EDT This is a thought"
  end

end
