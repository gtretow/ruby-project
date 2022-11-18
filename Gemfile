source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem 'tzinfo-data', '~> 1.2022', '>= 1.2022.6'
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bootsnap", require: false
gem 'devise', '~> 4.2'
gem 'pry', '~> 0.14.1'
gem 'rspec', '~> 3.4'
gem 'ffi', '~> 1.9', '>= 1.9.10'
gem 'factory_bot', '~> 4.8', '>= 4.8.2'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
