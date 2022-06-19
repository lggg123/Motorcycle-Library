# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Assuming you are using the RSpec testing framework, add the following code to the spec/support/factory_bot.rb file:

# spec/support/factory_bot.rb
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

Enable the autoloading of the support directory by uncommenting the following line in your spec/rails_helper.rb:

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

add these gems as well 

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
end

gem 'rspec-rails'

gem 'net-smtp'

for a complete graphql testing suite with types involved, use this

gem 'rspec-graphql_matchers'

add gem 'graphql'

In order to see users of a motorcycle we have to add in the field :user, Types::UserType, null: false. If not the user_id will not be shown.