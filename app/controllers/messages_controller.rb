class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_param)
    @message_thread = MessageThread.find(@message.message_thread_id)

    @message.receiver = current_user.equal_user?(@message_thread.started_user) ? @message_thread.to_user : @message_thread.started_user
    @message.sender = current_user
    @message.is_sender_read = true
    @message.save

    redirect_to @message_thread
  end

  private
    def message_param
      params.require(:message).permit(:body, :message_thread_id)
    end
end
