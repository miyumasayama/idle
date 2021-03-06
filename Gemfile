source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use mysql as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'mysql2', '>= 0.4.4'

group :production, :staging do
  gem 'unicorn'
end

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rails-controller-testing'
  
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'faker', '~> 1.1.2'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'launchy', '~> 2.3.0'
  gem "shoulda-matchers"
  gem 'rspec-rails', '~> 3.6'
  gem 'spring-commands-rspec'#一回の実行時間を短縮
  gem 'factory_bot_rails'
end
group :production do
  
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap'
gem 'jquery-rails'
gem 'slim-rails'
gem 'rails-i18n'
gem 'html2slim'
gem 'sprockets'
gem 'slim'
gem 'sprockets-rails'
gem 'mini_racer'
gem "bootstrap-sass"
gem "jquery-ui-rails"
gem 'carrierwave'
gem 'pry-rails'
gem 'rmagick'
gem 'enum_help'
gem 'kaminari'
gem 'rails-ujs'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'dotenv-rails'
gem 'sinatra'
gem 'listen', '~> 3.1.5'
gem 'google-api-client', '0.9.20', require: 'google/apis/youtube_v3'


gem 'react-rails'