current_path  = '/home/deploy/spoofsms/current'
rails_env     = 'production'


every 1.day, :at => '7:00 am' do
  command "cd #{current_path} && RAILS_ENV=production bundle exec rake user:confirm"
end

every 3.day, :at => '8:00 am' do
  command "cd #{current_path} && RAILS_ENV=production bundle exec rake user:remind"
end
