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

If you need help on how to seed your database with faker here is an example.

# create 10 tickets in DB
(1..10).each do |id|
    Ticket.create!(
        id: id,
# we have userIds between 1 and 20. Assign a ticket to a user 
# randomly
        user_id: rand(1..20), 
        title: Faker::University.name, 
        status: %w[opened in_progress completed].sample,
# generate a fake paragraph
        request: Faker::Lorem.paragraphs 
    )
end

This avoids the ids that I created that started at 19 and 20

In order to see users of a motorcycle we have to add in the field :user, Types::UserType, null: false. If not the user_id will not be shown.

yarn add apollo-client apollo-cache-inmemory apollo-link-http apollo-link-error apollo-link graphql graphql-tag react-apollo

rm app/javascript/packs/hello_react.jsx && touch app/javascript/packs/index.js

You generate a controller to serve the frontend of the application.

rails g controller Library index --skip-routes

update app/view/library/index.html.erb to ue the react root

### <div id="root">
### <%= javascript_pack_tag 'index' %>

create a file for storing our applications Apollo config:

### mkdir -p app/javascript/utils && touch app/javascript/utils/apollo.js

In this file we want to configure the two core entities of the Apollo application, the client and the cache (or more precisely, the functions to create both):

add graphql helper to config file 

config.include GraphqlHelper

also checkout graphql_helper.rb on spec and see how it was made to create queries and not have to code so much to make DRY code.

make sure to not make you query types file plural. I made the mistake of making motorcycle_query_types.rb instead of motorcycle_query_type.rb and the rspec test wasnt working properly. Now it is.