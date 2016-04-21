class WelcomeController < ApplicationController
  before_action :authorize_user, only:  [ :index ]
  def index
    respond_to do |format|
       @user = User.new
       @articles = Article.page(params[:page]).per_page(2).order('created_at DESC')
      format.html
      format.mobile
      format.js
    end
  end
  def goodbey50007
    @user = User.new
  end

  def show
    @users = User.last
  end

  def image
    @user = User.find_by(params[:id]) if params[:id].present?

  end

  def meta
    @article = Article.new
    @article =  Article.where('views == 50', 10).first
  end

  def tour
    @user = User.all

    @user = User.find_by(params[:id]) if params[:id].present?
    if @hour.present?
      @user.update_attributes(update_user_params)
      redirect_to '/dashboard/users'
    end
  end

  private

  def authorize_user
    unless !current_user.present?
      redirect_to current_user
    end
  end

end
