class ChatController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create(message_params)
    ActionCable.server.broadcast("chat_#{params[:room]}", message: render_message(@message))
    redirect_to chat_path
  end

  private

  def message_params
    params.require(:message).permit(:user, :content)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
