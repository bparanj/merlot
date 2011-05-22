server 'ccl', :app, :web, :db, :primary => true
set :local_config, %w(config/database.yml config/moonshine.yml)