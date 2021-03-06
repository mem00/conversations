class ConversationsController < ApplicationController

  def index
    @query = params[:query]
    if @query.present?
      @conversations = Conversation.where("LOWER(title) like ?", "%#{@query.downcase}%")
    else
      @conversations = Conversation.all
    end
  end

  def show
    @conversation = Conversation.includes(:messages, messages: [:thoughts]).find(params[:id])
    @query = params[:query]
    if @query.present?
      @messages = @conversation.messages.where("LOWER(text) like ?", "%#{@query.downcase}%").order(:created_at)
    else
      @messages = @conversation.messages.order(:created_at)
    end
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
