class SmsJob
  include SuckerPunch::Job

  def perform(spoof_id)
    ActiveRecord::Base.connection_pool.with_connection do
      spoof = Spoof.find(spoof_id)
      boot_twilio
      response = @lookup_client.phone_numbers.get(spoof.number)
      if response.country_code == "US"
        sms = @client.messages.create(
              from: Rails.application.secrets.twilio_numbers.sample,
              to: spoof.number,
              body: "#{spoof.body} http://youspoof.us")
        sleep 10
        spoof.status = sms.status
        spoof.save
      end
      #todo setup logging
      #todo generate a confirmation mailer to the user's email address
    end
  end

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
    @lookup_client = Twilio::REST::LookupsClient.new account_sid, auth_token
  end
end
