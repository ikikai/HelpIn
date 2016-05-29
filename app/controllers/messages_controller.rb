class MessagesController < ApplicationController
  before_action :authenticate_client!
  respond_to :html, :js

  def index
    @client = Client.find(1)
    @messages = Message.all
    @new_message = @client.conversations.last.messages.build
  end

  def create
    @client = Client.find(1)
    @message = @client.conversations.last.messages.build(message_params)
    respond_with { @message }
  end

  private

  def message_params
    params.require(:message).permit(:text, :conversation_id)
  end
end
