class MessagesController < ApplicationController
 
  def index
    @query = params[:query]
    if @query.present?
      @messages = Message.includes(:conversation).where("LOWER(text) like ?", "%#{@query.downcase}%")
    else
      @messages = Message.includes(:conversation).all
    end
  end
  def new
    @conversation = Conversation.find(params[:conversation_id])
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
