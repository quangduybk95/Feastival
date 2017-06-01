source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.2"
gem "sqlite3"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1.7"
gem "bootstrap-sass", "~> 3.3", ">= 3.3.7"
gem "jquery-rails"
gem "i18n-js"
gem "kaminari"
gem "carrierwave"
gem "devise"
gem "config"
gem "mini_magick"
gem "geocoder"
gem "cancancan"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13.0"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rspec-collection_matchers"
  gem "shoulda-matchers", "~> 3.0"
  gem "database_cleaner", "~> 1.5"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "rails_best_practices"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "reek"
  gem "rails-controller-testing"
  gem "simplecov", require: false
  gem "rspec-activemodel-mocks"
  gem "cucumber-rails", require: false
  gem "rspec-rails", "~> 3.6"
  gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
