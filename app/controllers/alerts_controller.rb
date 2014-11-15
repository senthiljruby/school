class AlertsController < ApplicationController
  before_filter :authenticate

  def quick_sms
  end

  def noticeboard
  end


  def send_message
    setting = Settings.first
    waysms = WaySms::SmsSender.new(setting.username, setting.password)
    waysms.send(params[:mobile_number], "#{params[:messages]} - by vetri School")
    flash[:notice] = "Message Send Successfully"
    redirect_to alerts_quick_sms_path
  end
end
