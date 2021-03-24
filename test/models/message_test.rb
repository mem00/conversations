require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test "should not create message without text" do
  #   message = Message.new
  #   conversation = conversation(:one)
  #   message.conversation_id = conversation.id
  #   assert_raise(Exception) { message.save! }
  # end

  test "should not create message without conversation" do
    message = Message.new
    message.text = "hello world"
    assert_raise(Exception) { message.save! }
  end

  test "should succeed in creating message" do
    message = Message.new
    conversation = conversation(:one)
    message.text = "hello world"
    message.conversation_id = conversation.id
    assert message.save!
  end


end
