class PagesController < ApplicationController
  before_action :set_page,:set_check, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    if params[:search]
      @pages = Page.all.search(params[:search]).order(:created_at => :desc).page(params[:page]).per_page(8)
    else
      @pages = Page.all.order(:created_at => :desc).page(params[:page]).per_page(8)
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @articles = @page.articles.order(:created_at => :desc).page(params[:page]).per_page(1)
    @page.increment
    if @page.info.present?
    else
      @page.create_info
    end
  end

  # GET /pages/form
  def new
    @page = Page.new
  end



  # GET /pages/1/edit
  def edit
  end

  def delete_page
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Account deleted' }
      format.mobile { redirect_to pages_url, notice: 'Account deleted' }
    end
  end



  def vote
    vote = current_user.branches.build(:page_id => params[:page_id],:check => 1)
    if vote.save
      redirect_to current_user
    else
      redirect_to current_user
    end
  end
  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Tree created.' }
        format.mobile { redirect_to @page, notice: 'Tree created.' }
      else
        format.html { render :new }
        format.mobile { render :new }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Tree updated.' }
        format.mobile { redirect_to @page, notice: 'Tree updated.' }
      else
        format.html { render :edit }
        format.mobile { render :edit }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Account deleted' }
      format.json { head :no_content }
    end
  end

  def create_info
    Info.new(:page_id => params[:page_id])
  end

  private
  def set_check
    @check = 1
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_page1
      @page = Page.find(params[:id])
    end

  def set_page
    @page = Page.friendly.find(params[:id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :page_no, :user_id, :body, :image,:user_ids => [])
    end
end
