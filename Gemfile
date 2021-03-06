source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11', platforms: :ruby

# Use Puma as the app server
gem 'puma'

#CORS
gem 'rack-cors', :require => 'rack/cors'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: :mri

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails-swagger'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'

  gem 'better_errors'

  gem 'binding_of_caller'
end

#routing
gem 'routing-filter'

# Translations
gem 'route_translator'
gem 'globalize', github: 'globalize/globalize'
gem 'activemodel-serializers-xml'
gem 'globalize-accessors'
gem 'rails-i18n'

#Back
gem 'inherited_resources'
gem 'activeadmin', github: 'activeadmin/activeadmin'
gem 'activeadmin-translate', github: 'twintags/activeadmin-translate'
gem "nilify_blanks"
gem "strip_attributes"

#autentification
gem 'devise'
gem 'devise_token_auth'

#User role (Admin/Moderator)
gem 'rolify'

#custom seed command line
gem 'seedbank'

#Helper
gem 'acts_as_list', '0.9.5' 			#list
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'wisepdf' 				#pdf export
gem 'attribute_normalizer' 	#data integrity / params permit
gem 'uuidtools' 			#UUID
gem 'rubb', github: 'petejkim/rubb' #BBcode

#Avatar
gem 'gravtastic'

#Images
gem 'paperclip', '~> 5.1.0'

#CSS
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'

#User a bitmack for enum (multi values)
gem 'bitmask_attributes'

#Pagination
gem 'will_paginate', '~> 3.1.0'

#Export route in js file
gem 'js-routes'

gem 'groupdate'

#Maintenance mode
gem 'turnout'

#Error tracker
gem "sentry-raven"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
