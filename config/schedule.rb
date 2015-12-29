current_path  = '/home/deploy/spoofsms/current'

every 1.day, :at => '7:00 am' do
  command "cd #{current_path} && RAILS_ENV=production bundle exec rake user:confirm"
end

every 3.days, :at => '8:00 am' do
  command "cd #{current_path} && RAILS_ENV=production bundle exec rake user:remind"
end
