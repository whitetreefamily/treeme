class UserSettingController < ApplicationController

  def image

  end

  def password

  end

  def tree

  end

  def branching

  end

  def suggestion
    if params[:search]
      @pages = Page.all.search(params[:search]).order(:created_at => :desc).page(params[:page]).per_page(8)
    else
      @pages = Page.all.order(:created_at => :desc).page(params[:page]).per_page(8)
    end
  end

  def index
    if params[:search]
      @users = User.all.search(params[:search]).order(:created_at => :desc).page(params[:page]).per_page(10)
    else
      @users = User.order(:created_at => :desc).page(params[:page]).per_page(6)
    end
  end
end
