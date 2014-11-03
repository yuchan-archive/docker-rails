 #!/bin/bash

export RAILS_ENV=production
export SECRET_KEY_BASE=`bundle exec rake secret`
bundle exec rake assets:precompile
bundle exec rake db:migrate
bundle exec unicorn_rails -c config/unicorn.rb
