class PassbysController < ApplicationController
  before_action :authorize_user, only:  [ :new, :show]
  def show
    @user = User.new
  end


  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    respond_to do |format|
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      format.html { redirect_to current_user, notice: ' Welcome.' }
      format.mobile { redirect_to pages_path, notice: ' Welcome.' }
    else
      format.html {  render "new" }
      format.mobile { render "passbys/new", notice: ' Welcome.' }
      flash.now.alert = "Invalid email or password"
      end
    end
  end

  def destroy
    respond_to do |format|
      cookies.delete(:auth_token)
      format.html { redirect_to welcome_goodbey50007_path, notice: "Logged out!" }
      format.mobile { redirect_to welcome_index_url, notice: "Logged out!" }
    end
  end

  private

  def authorize_user
    unless !current_user.present?
      redirect_to current_user
    end
  end


end

