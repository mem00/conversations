require "test_helper"

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create conversation without title" do
    conversation = Conversation.new
    assert_raise(Exception) { conversation.save! }
  end

  test "should create start_date in callback" do
    conversation = Conversation.new
    conversation.title = "Hello World"
    conversation.save!
    assert conversation.start_date
  end
end