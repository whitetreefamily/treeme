class UsersController < ApplicationController
  before_action :correct_user,  only: [:edit]
  before_action :set_user,:authorize_user, only: [ :show,  :update,   :destroy]

  # GET /users
  # GET /users.json
  def index
    if params[:search]
    @users = User.all.search(params[:search]).order(:created_at => :desc).page(params[:page]).per_page(10)
    else
      @users = User.order(:created_at => :desc).page(params[:page]).per_page(6)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @page = Page.new


      ids = current_user.pages.pluck(:id) << current_user.id
       @articles = Article.where(page_id: ids).page(params[:page]).per_page(3).order('created_at DESC')
      @pages = Page.all.order(:created_at => :desc).page(params[:page]).per_page(8)

  end
  # GET /users/form
  def form
    @user = User.new
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @pages = Page.all.order(:created_at => :desc).page(params[:page]).per_page(8)


  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { render "passbys/new", notice: 'Account created, Sign in' }
        format.mobile {  render "passbys/new" , notice: 'Account created, Sign in' }
      else
        format.html { redirect_to root_path, notice: 'Sign up was not successful,' }
        format.mobile { redirect_to root_path ,notice: 'Sign up was not successful,'}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash.now[:error] = "Incorrect Current Password"
      render 'edit'
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
   if  cookies.delete(:auth_token)
      @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out!" }
      format.mobile { redirect_to root_url, :notice => "Logged out!" }
    end
   end
  end

  def change_password
    @user = current_user
    current_password = params[:user][:current_password]
    user = User.authenticate(@user.email, current_password)
    if @user && user
      # @user.update.password = params[:new_password]
      # new_password = params[:password]
      # @user.update(new_password)
      User.update(@user, change_password_params)
      @user.save
      flash[:success] = "Password successfully changed!"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Your old password was incorrect. Please try again."
      redirect_to user_path(current_user)
    end
  end



  private

  def authorize_user
    if !current_user.present?
      redirect_to root_url
      flash[:error] = " Sign up "
    end
  end

  def correct_user
    @user = User.find(params[:id])
     unless   @user.id == current_user.id
          redirect_to current_user
      end
  end

  def change_password_params
    params.require(:user).permit(:password)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password_confirmation, :password,:image,:bio,:sex, :category_ids => [], :page_ids => [])
    end
end
