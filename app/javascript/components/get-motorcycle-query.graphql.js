import gql from 'graphql-tag';

const GET_MOTORCYCLE_QUERY = gql`
    {
        motorcycle(id: "123") {
            title
            description
            image_url
            user_id
        }
    }
`;

export default GET_MOTORCYCLE_QUERY;