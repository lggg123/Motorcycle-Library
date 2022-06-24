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

add graphql helper to config file 

config.include GraphqlHelper

also checkout graphql_helper.rb on spec and see how it was made to create queries and not have to code so much to make DRY code.

make sure to not make you query types file plural. I made the mistake of making motorcycle_query_types.rb instead of motorcycle_query_type.rb and the rspec test wasnt working properly. Now it is.

# To Setup React

yarn add apollo-client apollo-cache-inmemory apollo-link-http apollo-link-error apollo-link graphql graphql-tag react-apollo

rm app/javascript/packs/hello_react.jsx && touch app/javascript/packs/index.js

You generate a controller to serve the frontend of the application.

Set config/routes.rb

root 'library#index'

rails g controller Library index --skip-routes

update app/view/library/index.html.erb to ue the react root

### <div id="root">
### <%= javascript_pack_tag 'index' %>

create a file for storing our applications Apollo config:

### mkdir -p app/javascript/utils && touch app/javascript/utils/apollo.js

In this file we want to configure the two core entities of the Apollo application, the client and the cache (or more precisely, the functions to create both):

`// app/javascript/utils/apollo.js

// client
import { ApolloClient } from 'apollo-client';
// cache
import { InMemoryCache } from 'apollo-cache-inmemory';
// links
import { HttpLink } from 'apollo-link-http';
import { onError } from 'apollo-link-error';
import { ApolloLink, Observable } from 'apollo-link';
export const createCache = () => {
  const cache = new InMemoryCache();
  if (process.env.NODE_ENV === 'development') {
    window.secretVariableToStoreCache = cache;
  }
  return cache;
};`

Each response query is put into a cache. Before making a request, apollo-client ensures that the response hasn't been cached yet, request is not performed if there is a cache. 

A cache key is a concatenation of the object id and __typename.

Since we user HTTP POST as a transport, we need to attach a proper CSRF token to every
request to pass the forgery protection check in the Rails app. Check meta[name='csrf-token']

`// app/javascript/utils/apollo.js
// ...
// getToken from meta tags
const getToken = () =>
  document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const token = getToken();
const setTokenForOperation = async operation =>
  operation.setContext({
    headers: {
      'X-CSRF-Token': token,
    },
  });
// link with token
const createLinkWithToken = () =>
  new ApolloLink(
    (operation, forward) =>
      new Observable(observer => {
        let handle;
        Promise.resolve(operation)
          .then(setTokenForOperation)
          .then(() => {
            handle = forward(operation).subscribe({
              next: observer.next.bind(observer),
              error: observer.error.bind(observer),
              complete: observer.complete.bind(observer),
            });
          })
          .catch(observer.error.bind(observer));
        return () => {
          if (handle) handle.unsubscribe();
        };
      })
  );
  `

  Lets look at how we can log Errors

  `
  // app/javascript/utils/apollo.js
//...
// log erors
const logError = (error) => console.error(error);
// create error link
const createErrorLink = () => onError(({ graphQLErrors, networkError, operation }) => {
  if (graphQLErrors) {
    logError('GraphQL - Error', {
      errors: graphQLErrors,
      operationName: operation.operationName,
      variables: operation.variables,
    });
  }
  if (networkError) {
    logError('GraphQL - NetworkError', networkError);
  }
})
`
In production makes sense to use Honeybadger to send errors to the external system.

Let's tell the client about the endopoint for making queries.

`// app/javascript/utils/apollo.js
//...
// http link
const createHttpLink = () => new HttpLink({
  uri: '/graphql',
  credentials: 'include',
})
`

Finally, we're ready to create an Apollo client instance:

`
// app/javascript/utils/apollo.js
//...
export const createClient = (cache, requestLink) => {
  return new ApolloClient({
    link: ApolloLink.from([
      createErrorLink(),
      createLinkWithToken(),
      createHttpLink(),
    ]),
    cache,
  });
};
`

Provider React component allows consuming components to subscribe to context changes.

The provider component accepts a value prop to be passed to consuming components that are descendants of this Provider. One Provider can be connected to many consumers. Providers can be nested to override values deeper within the tree.

All consumers that are descendants of a Provider will re-render whenever the Provider’s value prop changes. The propagation from Provider to its descendant consumers (including .contextType and useContext) is not subject to the shouldComponentUpdate method, so the consumer is updated even when an ancestor component skips an update.
Changes are determined by comparing the new and old values using the same algorithm as Object.is.

We also have to change app/javascript/packs/index.js to use the newly created provider.

Now we must add tests. Tests on the frontend are much different that the backend test and providing even more mocking and behavior tests.

here are the following commands to type into the terminal to be able to prepare the jest tests.

`yarn add apollo-boost graphql cross-fetch @babel/register -D`


