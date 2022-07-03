RSpec.describe 'Invoice Query', type: :request do
    include_context 'GraphQL Client'

    it "loads users by ID" do
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
        }
        GRAPHQL
    
        user = create(:user, first_name: "Johnson", last_name: "Smith", email: "johnsonsmith22@gmail.com")
        user_id = MySchema.id_from_object(user, Types::User, {})
        result = MySchema.execute(query_string, variables: { id: user_id })
    
        post_result = result["data"]["node"]
        # Make sure the query worked
        assert_equal post_id, post_result["id"]
        assert_equal "Johnson", post_result["first_name"]
        assert_equal "Smith", post_result["last_name"]
        assert_equal "johnsonsmith22@gmail.com", post_result["email"]
    end
end