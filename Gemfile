source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'


gem 'browserify-rails', '~> 3.1.0'
gem 'carmen-rails', '~> 1.0.0'
gem 'countries', '~> 2.0.0.rc'
gem 'devise', '~> 4.2.0'
gem 'enum_help', '~> 0.0.16'
gem 'faraday', '~> 0.8.11'
gem 'gon', '~> 6.0.0'
gem 'haml-rails', '~> 0.5.0'
gem 'icalendar', '~> 2.3.0'
gem 'jbuilder', '~> 2.6.0'
gem 'money-rails', '~> 1.7.0'
gem 'nested_form', '~> 0.3.0'
gem 'puma', '~> 3.0'
gem 'sass-rails',   '~> 5.0.6'
gem 'slack-notifier', '~> 2.0.0'
gem 'honoka-rails', '>= 3.3.6.3'
gem 'uglifier', '~> 2.5.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'rails_12factor'
  gem 'execjs', '~> 2.7.0'
end

group :development, :test do
  gem 'byebug', '~> 3.4.0'
  gem 'spring', '~> 2.0.1'
  gem "erb2haml", '~> 0.1.0'
  gem 'better_errors', '~> 2.1.0'
  gem 'pry-rails', '~> 0.3.0'
  gem 'dotenv-rails', '~> 2.1.1'
end

group :development, :production do
  gem 'sidekiq', '~> 4.2.2'
  gem 'redis-namespace', '~> 1.5.2'
  gem 'ruby-gmail', '~> 0.3.1', require: 'gmail'
  gem 'whenever', '~> 0.9.0', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'letter_opener_web', '~> 1.3.0'
  gem 'web-console', '3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_girl_rails', '~> 4.7.0'
  gem 'database_rewinder', '~> 0.6.3'
  gem 'capybara'
  gem 'rspec-rails', '~> 3.5.2'
  gem 'faker', '~> 1.4.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


