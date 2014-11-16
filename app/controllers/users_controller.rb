class UsersController < ApplicationController
 layout "sessions"
 before_filter :basic_authenticate
 def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  protected

  def basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "$enthil@1617"
    end
  end
end
