import gql from 'graphql-tag';

const GET_USER_QUERY = gql`
    {
        user(id: "123") {
            first_name
            last_name
            email
        }
    }
`;

export default GET_USER_QUERY;