RSpec.describe QueryTypes::UserQueryType do
    # avail type definer in our tests
    types = GraphQL::Define::TypeDefiner.instance

    let!(:users) { create_list(:user, 5) }

    describe 'querying all users' do

        it 'has a user that returns a User type' do
            expect(subject).to have_field(:users).that_returns(types[Types::UserType])
        end
        
        it 'returns all our created users' do
            query_result = subject.fields['users'].resolve(nil, nil, nil)
        
            users.each do |list|
                expect(query_result.to_a).to include(list)
            end

            expect(query_result.count).to eq(users.count)
        end
    end
end