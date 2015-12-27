class SpoofsController < ApplicationController
  before_action :authenticate_user!
  def index
    @spoof = current_user.spoofs.new
    @spoofs = current_user.spoofs.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def create
  	@spoof = current_user.spoofs.new(spoof_params)

    respond_to do |format|
      if @spoof.save && user? && current_user.quotum.sum < 3
        current_user.quotum.increase_quotum!
        SmsJob.new.async.perform(@spoof.id)
        format.html { redirect_to root_path, notice: "Message Sent" }
        format.json { render :show, status: :created, location: @spoof }
      elsif @spoof.save && admin? && current_user.quotum.sum < 100
        current_user.quotum.increase_quotum!
        SmsJob.new.async.perform(@spoof.id)
        format.html { redirect_to root_path, notice: "Message Sent" }
        format.json { render :show, status: :created, location: @spoof }
      else
        format.html { redirect_to root_path, :flash => { :error => @spoof.errors.full_messages.join(', ')<< ' Message Not Sent'}}
        format.json { render json: @spoof.errors, status: :unprocessable_entity }
      end
    end
  end

  def resend_spoof
    orig_spoof = Spoof.find(params[:id])
    new_spoof = Spoof.new(
      user_id: orig_spoof.user_id,
      body: orig_spoof.body,
      number: orig_spoof.number)
    if user? && current_user.quotum.sum < 3
      new_spoof.save
      current_user.quotum.increase_quotum!
      SmsJob.new.async.perform(new_spoof.id)
      redirect_to root_path, notice: "Message Sent"
    elsif admin? && current_user.quotum.sum < 100
      new_spoof.save
      current_user.quotum.increase_quotum!
      SmsJob.new.async.perform(new_spoof.id)
      redirect_to root_path, notice: "Message Sent"
    else
      redirect_to root_path, notice: "Message Not Sent"
    end
  end

private

  def spoof_params
    params.require(:spoof).permit(:body, :number)
  end
end
