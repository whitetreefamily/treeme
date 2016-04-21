class AdminsController < ApplicationController

  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end


  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_password
    # @user.update.password = params[:new_password]
    # new_password = params[:password]
    # @user.update(new_password)

    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end



  def change_admin
    @admin = current_admin
    conform_password = params[:admin][:password_confirmation]
    current_password = params[:admin][:current_password]
    if    current_password == conform_password
      user = Admin.authenticate(@admin.username, current_password)
      if @admin && user
        # @user.update.password = params[:new_password]
        # new_password = params[:password]
        # @user.update(new_password)
        Admin.update(@admin, change_admin_params)
        @admin.save
        flash[:success] = "Password successfully changed!"
        redirect_to user_path(current_admin)
      else
        flash[:danger] = "Your old password was incorrect. Please try again."
        redirect_to current_admin
      end
    else
      flash[:danger] = "No password confirmation or  Your old password was incorrect "
      redirect_to current_admin
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authorize_user
    if   current_user.change == true
      redirect_to current_user
    else

    end
  end
  def password_user
    if !current_user.admin.password_hash.present?
      render "admins/password"
    end
  end
  def correct_user
    if   current_user.id == current_admin.id && current_admin.check == true
    else
      current_admin
    end
  end


  def change_admin_params
    params.require(:admin).permit(:password,:password_confirmation)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:check,:username,:password_confirmation, :user_id, :password,:position)
    end
end
