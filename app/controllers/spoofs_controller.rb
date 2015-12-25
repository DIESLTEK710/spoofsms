class SpoofsController < ApplicationController
  def index
    @spoofs = Spoof.order("created_at DESC")
    if current_user
      @spoof = current_user.spoofs.new
    else
      @spoof = Spoof.new
    end
  end

  def create
  	@spoof = current_user.spoofs.new(spoof_params)

    respond_to do |format|
      if @spoof.save
        SmsJob.new.async.perform(@spoof.id)
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
    params.require(:spoof).permit(:body, :number)
  end
end
