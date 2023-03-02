server '89.43.33.250', user: 'deploy', roles: %w[app db web]

set :deploy_to, '/home/deploy/staging/quotes'
set :branch, 'staging'
