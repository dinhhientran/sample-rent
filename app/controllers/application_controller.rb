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

  protected
    def render_not_found
      render :file => "#{Rails.root}/public/404.html", :status => 404
    end
end
