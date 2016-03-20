class BranchesController < ApplicationController


  # GET /branches
  # GET /branches.json

  # GET /branches/1
  # GET /branches/1.json

  def vote
    vote = current_user.branches.new(:page_id => params[:page_id],:check => 1)
    if vote.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "Thank you for voting." }
        format.mobile { redirect_to :back, notice: "Thank you for voting." }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, alert: "Unablet to vote, perhaps you already did."}
        format.mobile { redirect_to :back, alert: "Unablet to vote, perhaps you already did."}
      end
    end
  end


  # POST /branches
  # POST /branches.json
  def create
    @branch = current_user.branches.build(:page_id => params[:page_id],:check => 1)
    respond_to do |format|
    if @branch.save
      format.html { redirect_to @branch.user, notice: "You just Branch in this Page" }
      format.mobile { redirect_to @branch.user, notice: "You just Branch in this Page" }
    else
      format.html { redirect_to  @branch.page, notice: "You  have already branch in" }
      format.mobile { redirect_to  @branch.page, notice: "You  have already branch in" }
     end
    end
  end


  # DELETE /branches/mobile
  # DELETE /branches/1.json

  def looking
    respond_to do |format|
      @branch = current_user.branches.find(params[:id])
      @branch.destroy
      format.html { redirect_to current_user, notice: "Branch Out" }
      format.mobile { redirect_to current_user, notice: "Branch Out" }
    end
  end
  # DELETE /page/delete



  def destroy
    respond_to do |format|
      @branch = current_user.branches.find(params[:id])
    @branch.destroy
    format.html { redirect_to current_user, notice: "Branch Out" }
    format.mobile { redirect_to current_user, notice: "Branch Out" }
   end
  end



    # Never trust parameters from the scary internet, only allow the white list through.

end
