class VotePagesController < ApplicationController
  before_action :set_vote_page, only: [:show, :edit, :update, :destroy]

  # GET /vote_pages
  # GET /vote_pages.json
  def index
    @vote_pages = VotePage.all.order(:created_at => :desc).page(params[:page]).per_page(5)
  end

  # GET /vote_pages/1
  # GET /vote_pages/1.json
  def show
    @contestants = @vote_page.contestants
    @contestant = Contestant.new
  end

  # GET /vote_pages/form
  def new
    @vote_page = VotePage.new
  end

  # GET /vote_pages/1/edit
  def edit
  end

  # POST /vote_pages
  # POST /vote_pages.json
  def create
    @vote_page = VotePage.new(vote_page_params)

    respond_to do |format|
      if @vote_page.save
        format.html { redirect_to @vote_page, notice: 'Vote page was successfully created.' }
        format.json { render :show, status: :created, location: @vote_page }
      else
        format.html { render :new }
        format.json { render json: @vote_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_pages/1
  # PATCH/PUT /vote_pages/1.json
  def update
    respond_to do |format|
      if @vote_page.update(vote_page_params)
        format.html { redirect_to @vote_page, notice: 'Vote page was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_page }
      else
        format.html { render :edit }
        format.json { render json: @vote_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_pages/1
  # DELETE /vote_pages/1.json
  def destroy
    @vote_page.destroy
    respond_to do |format|
      format.html { redirect_to vote_pages_url, notice: 'Vote page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_page
      @vote_page = VotePage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_page_params
      params.require(:vote_page).permit(:name, :user_id)
    end
end
