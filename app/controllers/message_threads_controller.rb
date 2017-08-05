class MessageThreadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @message_threads = MessageThread.of_user(current_user)
  end

  def show
    @message_thread = MessageThread.find(params[:id])
  end

  # in  users want to send message to themselves or to_user does not exist,
  # redirect them to 'not found' page
  def new
    if User.exists?(params[:to_user]) && current_user.id != params[:to_user]
      @to_user = User.find(params[:to_user])
      @message_thread = MessageThread.new
    else
      render_not_found
    end
  end

  def create
    @message_thread = MessageThread.new(message_thread_param)
    @message_thread.started_user_id = current_user.id

    if @message_thread.save
      message = Message.new
      message.message_thread = @message_thread
      message.sender = current_user
      message.receiver = @message_thread.to_user
      message.body = params[:message]

      if message.save
        @message_thread.update(latest_message_id: message.id)
        redirect_to @message_thread
      end
    end
  end

  private
    def message_thread_param
      params.require(:message_thread).permit(:to_user_id, :subject)
    end
end
