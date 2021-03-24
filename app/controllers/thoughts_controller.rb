class ThoughtsController < ApplicationController

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.find(params[:message_id])
    @thought = Thought.new
  end

  def create
    thought = Thought.create!(thought_params)

    redirect_to conversation_path(thought.message.conversation_id)
  rescue => e
    puts "Error: #{e}"
  end

  private

  def thought_params
    params.require(:thought).permit(:text, :message_id)
  end
end
