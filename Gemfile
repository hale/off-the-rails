source 'https://rubygems.org'

gem 'rails'
gem 'heroku'
gem 'thin'
# for creating sample database on the server
gem 'faker'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
# parses markdown to html
gem 'redcarpet'
# exposes full text search capabilities from PostgreSQL
gem 'texticle', '~> 2.0', :require => 'texticle/rails'
# for uploading files to amazon s3 through paperclip
gem 'aws-s3'

group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
end

gem 'activeadmin'
gem 'paperclip'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'
  gem 'sass-rails'
  gem "meta_search",    '>= 1.1.0.pre'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
end

group :test, :development do
    gem 'rspec-rails'
    gem 'guard-rspec'
    gem 'factory_girl_rails'
    gem 'database_cleaner'
    gem 'paperclip'
    gem 'railroady'
    # gem 'annotate', '> 2.4.0'
    gem 'annotate', :git => 'http://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
    gem 'irbtools-more', :require => false
    gem 'ruby-debug19'
end

group :test do
  gem 'cucumber-rails'
end

group :production do
   gem 'pg'
end

gem 'jquery-rails'
gem 'twitter'
# gem 'mobile-fu'
gem 'geocoder'
gem 'randumb' # lets you get random records efficiently

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
