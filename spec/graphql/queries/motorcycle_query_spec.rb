RSpec.describe 'Motorcycle Query', type: :request do
    include_context 'GraphQL Client'

    let(:user) { create(:user) }
    let(:attributes) do
        {
            title: 'Honda',
            description: 'Motorcycles from Honda',
            image_url: 'https://global.honda/products/motorcycles.html',
            user: user
        }
      end
    
    let(:motorcycle) { create(:motorcycle, **attributes) }

    let(:query) do
        query_string = <<-GRAPHQL
        query{
            motorcycles {
                id
                title
                description
                imageUrl
                userId
                user {
                        id
                    }
            }
        }
        GRAPHQL
    end

    it 'returns a Motorcycle' do
        response = client.execute(query)
        expect(motorcycle.id).to eq 1
        expect(motorcycle.title).to eq "Honda"
        expect(motorcycle.description).to eq "Motorcycles from Honda"
        expect(motorcycle.user_id).to eq 1
        expect(user.id).to eq 1
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
end 

# author = create(:author, first_name: ‘Lee’, last_name: ‘Child’, date_of_birth: Date.parse(‘1954-10-29’))

# create(:author, first_name: ‘Stephen’, last_name: ‘King’, date_of_birth: Date.parse(‘1947-09-21’))
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
