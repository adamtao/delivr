source 'https://rubygems.org'
# ruby '2.0.0'
gem 'rails', '4.0.4'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'figaro'
gem 'mysql2'
gem 'acts_as_list'
gem 'puma' # web server
gem 'capistrano', '~>2.15'
gem 'net-ssh', '~> 2.8.1', :git => "https://github.com/net-ssh/net-ssh"

# Users, roles, etc. gems:
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-soundcloud'
gem 'omniauth-gplus'
gem 'omniauth-identity'
gem 'cancan'
gem 'rolify'

# Look and feel gems:
gem 'foundation-rails', '5.0.3.1'
gem 'simple_form'
gem 'friendly_id'
gem 'RedCloth'

gem 'stripe'
gem 'money-rails'
gem 'paperclip' # for attaching images, etc. to records

group :production do
  gem 'therubyracer'
end

group :development do
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'zeus'
end

group :test do
  gem 'database_cleaner'
  gem 'turn'
  gem 'launchy'
  gem 'capybara'
  gem 'capybara_minitest_spec'
  gem 'capybara-webkit'
  gem 'minitest-spec-rails'
  gem 'minitest-wscolor'
  gem 'guard-minitest'
end