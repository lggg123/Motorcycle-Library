RSpec.describe 'Motorcycle Query', type: :request do
    include_context 'GraphQL Client'

    it "loads motorcycles by ID" do
        query_string = <<-GRAPHQL
        query($id: Int!){
            motorcycle(id: $id) {
                id
                description
                imageUrl
                userId
                user {
                        id
                    }
            }
        }
        GRAPHQL
    
        motorcycle = create(:motorcycle, title: "Toyota", description: "An extravagant collection", image_url: "https://www.vitalmx.com/photos/features/Vital-MX-Pit-Bits-Anaheim-1-2011,35917/JGR-Toyota-Concept-Bike,43110/GuyB,64", user: User.find_by(:id))
        motorcycle_id = MySchema.id_from_object(motorcycle, Types::Motorcycle, {})
        result = MySchema.execute(query_string, variables: { id: motorcycle_id })
    
        post_result = result["data"]["node"]
        # Make sure the query worked
        assert_equal motorcycle_id, post_result["id"]
        assert_equal "Toyota", post_result["title"]
        assert_equal "An extravagant collection", post_result["description"]
        assert_equal "https://www.vitalmx.com/photos/features/Vital-MX-Pit-Bits-Anaheim-1-2011,35917/JGR-Toyota-Concept-Bike,43110/GuyB,64", post_result["image_url"]
    end
end