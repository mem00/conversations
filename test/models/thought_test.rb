require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not create thought without text" do
    thought = Thought.new
    message = message(:one)
    thought.message_id = message.id
    assert_raise(Exception) { thought.save! }
  end

  test "should not create thought without message" do
    thought = Thought.new
    thought.text = "hello world"
    assert_raise(Exception) { message.save! }
  end

  test "should succeed in creating thought" do
    thought = Thought.new
    message = message(:one)
    thought.text = "hello world"
    thought.message_id = message.id
    assert thought.save!
  end

end
