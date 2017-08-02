class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :count_unread_messages

  def count_unread_messages
    if user_signed_in?
      @total_unread_messages = Message.count_unread_messages(current_user.id)
    end
  end
end
