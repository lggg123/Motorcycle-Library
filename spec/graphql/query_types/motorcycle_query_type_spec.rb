RSpec.describe QueryTypes::MotorcycleQueryType do
    # avail type definer in our tests
    types = GraphQL::Define::TypeDefiner.instance

    let!(:motorcycles) { create_list(:motorcycle, 10) }

    describe 'querying all motorcycles' do

        it 'has a user that returns a Motorcyle type' do
            expect(subject).to have_field(:motorcycles).that_returns(types[Types::MotorcycleType])
        end
        
        it 'returns all our created motorcycles' do
            query_result = subject.fields['motorcycles'].resolve(nil, nil, nil)
        
            motorcycles.each do |list|
                expect(query_result.to_a).to include(list)
            end

            expect(query_result.count).to eq(motorcycles.count)
        end
    end
end