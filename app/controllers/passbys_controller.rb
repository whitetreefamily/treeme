class PassbysController < ApplicationController
  before_action :authorize_user, only:  [ :new, :show]
  def show
    @user = User.new
  end


  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to current_user, :notice =>  "Welcome "
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def authorize_user
    unless !current_user.present?
      redirect_to current_user
    end
  end


end

