class MessagesController < ApplicationController

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new
  end

  def create
    message = Message.create!(message_params)
    redirect_to conversation_path(message.conversation_id)
  rescue => e
    puts "Error: #{e}"
  end

  private

  def message_params
    params.require(:message).permit(:text, :conversation_id)
  end
end
