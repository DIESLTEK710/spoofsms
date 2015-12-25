class SmsJob
  include SuckerPunch::Job

  def perform(spoof_id)
    ActiveRecord::Base.connection_pool.with_connection do
      spoof = Spoof.find(spoof_id)
      #do something
      boot_twilio
      #do somethign more with twilio, update response state from API
      sms = @client.messages.create(
            from: Rails.application.secrets.twilio_numbers.sample,
            to: spoof.number,
            body: spoof.body)
      #todo
      #sleep 10
      #spoof.status = sms.status
      #spoof.save
    end
  end

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
