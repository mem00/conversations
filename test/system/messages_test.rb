require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit messages_url
  #
  #   assert_selector "h1", text: "Messages"
  # end
  test "create a message" do
    visit conversations_path
  
    click_on "New conversation"
  
    fill_in "Title", with: "Hello World"
  
    click_on "Create Conversation"
  
    fill_in "Text", with: "This is a message"

    click_on "Create Message"

    assert_text "EDT This is a message"
  end
end
