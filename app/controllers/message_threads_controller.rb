class MessageThreadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @message_threads = MessageThread.of_user(current_user)
  end

  def show
    @message_thread = MessageThread.find(params[:id])
  end
end
