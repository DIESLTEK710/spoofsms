class SpoofsController < ApplicationController
  def index
    @spoofs = Spoof.all
    if current_user
      @spoof = current_user.spoofs.new
    else
      @spoof = Spoof.new
    end
  end

  def create
  	@spoof = Spoof.new(spoof_params)

    respond_to do |format|
      if @spoof.save
        format.html { redirect_to root_path, notice: "Message Sent" }
        format.json { render :show, status: :created, location: @spoof }
      else
        format.html { redirect_to root_path, notice: "Message Not Sent" }
        format.json { render json: @spoof.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def spoof_params
    params.require(:spoof).permit(:body, :user_id)
  end
end
