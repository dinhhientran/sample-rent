class MessagesController < ApplicationController
  before_action :authenticate_user!

  def compose
    @to_user = User.find(params[:to_user])

    raise ActionController::RoutingError.new('Not Found') if @to_user.nil?
  end

  def send
  end
end
