RSpec.describe 'User Query', type: :request do
    include_context 'GraphQL Client'

    let(:query) do
        query_string = <<-GRAPHQL
        query($id: ID!){
            node(id: $id) {
            ... on User {
                    id
                    first_name
                    last_name
                    email
                }
            }
        }
        GRAPHQL

        it 'returns an user' do
            response = client.execute(query, id: 26)
            user = response.data.user
            expect(user.id).to eq 26
            expect(user.first_name).to eq "Mack Hermiston"
            expect(user.last_name).to eq "Honey Dicki"
            expect(user.email).to eq "prudence_harris@cartwright.co"
        end
    end
end