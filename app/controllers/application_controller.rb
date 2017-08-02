class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :count_unread_messages

  def count_unread_messages
    @total_unread_messages = Message.where(:is_read => false).count.to_s
  end
end
