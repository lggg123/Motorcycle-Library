module Types
  QueryType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = 'Query'
    root_type.description = 'The query root'
    root_type.interfaces = []
    root_type.fields = Util.FieldCombiner.combine([])
  end
  # class QueryType < Types::BaseObject
  #   # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
  #   include GraphQL::Types::Relay::HasNodeField
  #   include GraphQL::Types::Relay::HasNodesField

  #   # Add root-level fields here.
  #   # They will be entry points for queries on your schema.

  #   # TODO: remove me
  #   field :users, [Types::UserType], null: false,
  #     description: "User type added by the generator"
  #   field :motorcycles, [Types::MotorcycleType], null: false,
  #     description: "Motorcycle type added by the generator"
  # end
end

