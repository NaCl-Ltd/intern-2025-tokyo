source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails",                      "8.0.2"
gem "image_processing",           "1.14.0"
gem "active_storage_validations", "3.0.1"
gem "bcrypt",                     "3.1.20"
gem "faker",                      "3.5.2"
gem "will_paginate",              "4.0.1"
gem "will_paginate-bootstrap-style", "0.3.0"
gem "bootstrap-sass",             "3.4.1"
gem "sassc-rails",                "2.1.2"
gem "sprockets-rails",            "3.4.2"
gem "importmap-rails",            "1.1.0"
gem "turbo-rails",                "2.0.16"
gem "stimulus-rails",             "1.3.4"
gem "jbuilder",                   "2.13.0"
gem "puma",                       "6.6.0"
gem "bootsnap",                   "1.18.6", require: false
gem "config",                     "4.2.1"
gem "ostruct",                    "0.6.2"
gem "mutex_m",                    "0.3.0"
gem "fiddle",                     "1.1.8"
gem "rdoc",                       "6.14.2"

group :development, :test do
  gem "sqlite3", "1.4.2"
  gem "debug", "1.11.0", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console", "4.2.0"
end

group :test do
  gem "capybara",                 "3.37.1"
  gem "selenium-webdriver",       "4.2.0"
  gem "webdrivers",               "5.0.0"
  gem "rails-controller-testing", "1.0.5"
  gem "minitest",                 "5.15.0"
  gem "minitest-reporters",       "1.5.0"
  gem "guard",                    "2.18.0"
  gem "guard-minitest",           "2.4.6"
end

group :production do
  gem "pg",         "1.3.5"
  gem "aws-sdk-s3", "1.114.0", require: false
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
# gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]