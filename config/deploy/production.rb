set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server 'youspoof.us', user: 'deploy', roles: %w{web app}
