class MySchema < GraphQL::Schema
    # Required:
    query Types::Query
    # Optional:
    mutation Types::Mutation
  end