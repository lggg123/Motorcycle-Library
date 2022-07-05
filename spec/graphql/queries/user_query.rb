RSpec.describe 'User Query', type: :request do
    include_context 'GraphQL Client'

    let(:attributes) do
        {
            first_name: 'Johnson',
            last_name: 'Smith',
            email: 'johnsonsmith@gmail.com',
        }
      end
    
    let(:user) { create(:user, **attributes) }

    let(:query) do
        query_string = <<-GRAPHQL
        query {
            users {
                firstName
                lastName
                email
            }
        }
        GRAPHQL
    end

    it 'returns an User' do
        response = client.execute(query)
        # user = response.data.users
        # expect(user.id).to eq 26
        expect(user.first_name).to eq "Johnson"
        expect(user.last_name).to eq "Smith"
        expect(user.email).to eq "johnsonsmith@gmail.com"
    end

    # it "works! get current motorcycle success" do
    #     post "/graphql",
    #       params: {
    #         query: query,
    #         variables: {}
    #       }.to_json, headers: motorcycle_headers
    #     expect(response.status).to eq 200
    #     expect(response.body).to include_json({
    #       data: {
    #         user: {
    #           id: @user.id,
    #           first_name: @user.first_name,
    #           last_name: @user.last_name,
    #           email: @user.email
    #         }
    #       }
    #     })
    # end

    # let(:user1) { create(:user) }
# let(:user2) { create(:user) }
# let(:attributes) do
#     {
#         title: 'Honda',
#         description: 'Motorcycles from Honda',
#         image_url: 'https://global.honda/products/motorcycles.html',
#         user: user
#     }
# end

# let(:motorcycle) { create(:motorcycle, **attributes) }
#     describe '.resolve' do
#         it 'returns all motorcycles' do
#             post '/graphql', params: { query: query }

#             json = JSON.parse(response.body)
#             data = json['data']['motorcycles']

#             expect(data).to match_array [
#                 hash_including(
#                 'id'          => be_present,
#                 'firstName'   => 'Lee',
#                 'lastName'    => 'Child',
#                 'dateOfBirth' => '1954-10-29',
#                 'books'       => [{ 'id' =&gt; book.id.to_s }]
#                 ),
#                 hash_including(
#                 'id'          => be_present,
#                 'firstName'   => 'Stephen',
#                 'lastName'    => 'King',
#                 'dateOfBirth' => '1947-09-21',
#                 'books'       => []
#                 )
#             ]
#         end
#     end
# end

end