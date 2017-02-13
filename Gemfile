source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'mysql2', '0.4.5'
gem 'redis', '~>3.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.2.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'execjs', '2.7.0'
gem 'devise', '~> 4.2.0'
gem 'omniauth', '1.5.0'
gem 'omniauth-facebook', '1.4.0'
gem 'therubyracer', :require => 'v8'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick', '4.6.0'
gem 'elasticsearch-model', '0.1.9'
gem 'elasticsearch-rails', '0.1.9'
gem 'rest-client', '2.0.0'
gem 'wysiwyg-rails', '2.4.2'
gem 'font-awesome-rails', '4.7.0.1'


group :development do
  gem 'web-console', '>= 3.3.0'
end

group :test, :development do
  gem 'byebug'
  gem 'mock_redis'
  gem 'sqlite3', '1.3.13'
  gem 'rspec-core', '~>3.5.4'
  gem 'rspec-rails', '~>3.5.2'
  gem 'rails-controller-testing'
  gem 'guard-rspec', require: false
  gem 'factory_girl_rails', '4.8.0'
  gem 'fuubar', '2.2.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '2.0.0'
  gem 'simplecov', :require => false
  gem 'spring-watcher-listen', '~> 2.0.0'
end
