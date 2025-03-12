class MessagesController < ApplicationController
    def index
      @messages = Message.order(created_at: :asc)
    end
  
    def create
      @message = Message.new(message_params)
  
      if @message.save
        # Success case is handled by broadcasts_to
      else
        respond_to do |format|
          format.turbo_stream { 
            render turbo_stream: turbo_stream.update('message_errors', 
              partial: 'messages/errors', locals: { message: @message }) 
          }
        end
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content, :user)
    end
end
  