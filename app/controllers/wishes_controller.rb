class WishesController < ApplicationController
  before_filter :authenticate
  def index
  end

  def send_message
    setting = Settings.first
    waysms = WaySms::SmsSender.new(setting.username, setting.password)
    waysms.send(params[:mobile_number], "#{params[:messages]} - by vetri School")
    flash[:notice] = "Message Send Successfully"
    redirect_to welcome_index_path
  end
end
