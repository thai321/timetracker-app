source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
# gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.8'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Addition Gem
gem 'devise', '~> 4.3'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'jquery-rails', '~> 4.0', '>= 4.0.5'
gem 'gritter', '~> 1.2' # notification
gem 'administrate', github: 'thoughtbot/administrate' # Admin
gem 'bourbon' # Admin
gem 'pundit', '~> 1.1' # Permission
gem 'puma', '~> 3.9', '>= 3.9.1' # Web Server
gem 'twilio-ruby', '~> 4.13' # text, phone API service
gem 'dotenv-rails', :groups => [:development, :test]
gem 'kaminari', '~> 1.0', '>= 1.0.1' # pagination
gem 'newrelic_rpm' # heroku addons to keep site alive (ping)
