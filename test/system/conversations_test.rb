require "application_system_test_case"

class ConversationsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit conversations_url
  #
  #   assert_selector "h1", text: "Conversations"
  # end

  test "view index" do
    visit conversations_path
    assert_text "New conversation"
  end

  test "create a converstaion" do
    visit conversations_path
  
    click_on "New conversation"
  
    fill_in "Title", with: "Hello World"
  
    click_on "Create Conversation"
  
    assert_text "Hello World -- #{Date.today}"
  end
end
