class MessagesController < ApplicationController
    def index
      @messages = Message.order(created_at: :asc)
    end
  
    def create
      @message = Message.create(message_params)
  
      unless @message.save
        redirect_to messages_path
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content, :user)
    end
end
  