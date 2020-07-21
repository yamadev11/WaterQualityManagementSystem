class UserController < ApplicationController
  def index
    @user = User.new
  end

  def sign_in
    user = User.find_by(name: params[:user][:name], password: params[:user][:password])
    if user
      session[:current_user_id] = user.id
      #AlertMailer.alert_mail.deliver_now
      redirect_to dashboard_index_path,  notice: 'Logged in!'
    else
      redirect_to user_index_path
    end
  end

  def sign_out
   session[:current_user_id] = nil
   redirect_to root_url, notice: 'Logged out!'
 end

end
