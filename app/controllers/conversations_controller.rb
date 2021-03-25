class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.includes(:messages, messages: [:thoughts]).find(params[:id])
    @messages = @conversation.messages.order(:created_at)
  end

  def new
  end

  def create
    conversation = Conversation.create!(conversation_params)
    redirect_to conversation_path(conversation.id)
  rescue => e
    puts "Error: #{e}"
  end


  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
