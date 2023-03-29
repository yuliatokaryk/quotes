# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'capistrano'
gem 'capistrano-passenger'
gem 'capistrano-rails'
gem 'capistrano-rbenv'
gem 'countries', '~> 5.3'
gem 'devise'
gem 'devise-i18n', '~> 1.10'
gem 'jbuilder', '~> 2.7'
gem 'net-imap'
gem 'net-pop'
gem 'net-smtp'
gem 'pagy'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.2'
gem 'rails', '~> 6.1.6'
gem 'sass-rails', '>= 6'
gem 'state_machines-activerecord'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop', '~> 1.48'
  gem 'rubocop-performance', '~> 1.16'
  gem 'rubocop-rails', '~> 2.18'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'pry-rails'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end
