class SmsJob
  include SuckerPunch::Job

  def perform(spoof_id)
    ActiveRecord::Base.connection_pool.with_connection do
      spoof = Spoof.find(spoof_id)
      #do something
      puts spoof.body
      #do somethign more with twilio, update response state from API
    end
  end
end
