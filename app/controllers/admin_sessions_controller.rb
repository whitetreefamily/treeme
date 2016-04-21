class AdminSessionsController < ApplicationController
       before_action :authorize_user, only: [ :new]
  def new
  end


       def admin_category
     @categories  = Category.all
   end

  def admin_tree
    if params[:search]
      @pages = Page.all.search(params[:search]).order(:created_at => :desc).page(params[:page]).per_page(8)
    else
      @pages = Page.all.order(:created_at => :desc).page(params[:page]).per_page(8)
    end

  end

  def admin_user
    if params[:search]
      @users = User.all.search(params[:search]).order(:created_at => :desc).page(params[:page]).per_page(10)
    else
      @users = User.order(:created_at => :desc).page(params[:page]).per_page(6)
    end
  end


  def create
    admin = Admin.authenticate(params[:username], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to current_admin, :notice =>  "Welcome Admin "
    else
      flash.now.alert = "Invalid Name or password"
      render "new"
    end
  end





  def destroy
    session[:admin_id] = nil
    redirect_to current_user, :notice => "Logged out!"
  end

  def authorize_user
    if !current_user.admin.password_hash.present?
      redirect_to admins_path
    end
  end
       def admin_params
         params.require(:admin).permit(:password_confirmation,:id, :user_id, :password)
       end
end

