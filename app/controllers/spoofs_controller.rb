class SpoofsController < ApplicationController
  def index
    if current_user
      @spoof = current_user.spoofs.new
      @spoofs = current_user.spoofs.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    else
      @spoof = Spoof.new
      @spoofs = Spoof.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    end
  end

  def create
  	@spoof = current_user.spoofs.new(spoof_params)

    respond_to do |format|
      if current_user.quotum.sum < 3
        @spoof.save
        current_user.quotum.increase_quotum!
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
