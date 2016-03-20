class ContestantsController < ApplicationController
  before_action :set_contestant, only: [:show, :edit, :update, :destroy]

  # GET /contestants
  # GET /contestants.json
  def index
    @contestants = Contestant.all
  end

  # GET /contestants/1
  # GET /contestants/1.json
  def show
  end

  # GET /contestants/form
  def new
    @contestant = Contestant.new
  end

  # GET /contestants/1/edit
  def edit
  end

  # POST /contestants
  # POST /contestants.json
  def create
    @contestant = Contestant.new(contestant_params)

    respond_to do |format|
      if @contestant.save
        format.html { redirect_to @contestant.vote_page_path, notice: 'Contestant was successfully created.' }
        format.json { render :show, status: :created, location: @contestant }
      else
        format.html { render :new }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contestants/1
  # PATCH/PUT /contestants/1.json
  def update
    respond_to do |format|
      if @contestant.update(contestant_params)
        format.html { redirect_to @contestant, notice: 'Contestant was successfully updated.' }
        format.json { render :show, status: :ok, location: @contestant }
      else
        format.html { render :edit }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contestants/1
  # DELETE /contestants/1.json
  def destroy
    @contestant.destroy
    respond_to do |format|
      format.html { redirect_to contestants_url, notice: 'Contestant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    vote = current_user.contestant_votes.new(value: params[:value], contestant_id: params[:id])
    if vote.save
      respond_to do |format|
        format.xml
        format.html { redirect_to :back, notice: "Thank you for voting." }
        format.js { render 'vote.js.erb'}
      end
    else
      respond_to do |format|
        format.xml
        format.html { redirect_to :back, alert: "Unablet to vote, perhaps you already did."}
        format.js {render 'fail_vote.js.erb'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contestant
      @contestant = Contestant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contestant_params
      params.require(:contestant).permit(:user_id, :image, :name, :title, :vote_page_id)
    end
end
