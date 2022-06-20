module QueryTypes
  MotorcycleQueryType = GraphQL::ObjectType.define do
      name 'MotorcycleQueryType'
      description 'The user query type'

      field :motorcycles, types[Types::MotorcycleType], 'returns all motorcycles' do
          resolve ->(_obj, _args, _ctx) { Motorcycle.all }
      end
  end
end