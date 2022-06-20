module QueryTypes
    UserQueryType = GraphQL::ObjectType.define do
        name 'UserQueryType'
        description 'The user query type'

        field :users, types[Types::UserType], 'returns all users' do
            resolve ->(_obj, _args, _ctx) { User.all }
        end
    end
end