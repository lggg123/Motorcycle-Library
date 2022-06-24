import React from 'react';
import { Query } from 'react-apollo';
import GET_USER_QUERY from './get-user-query.graphql';
import User from './User';
const UserContainer = () => (
  <Query query={GET_USER_QUERY}>
    {({ loading, error, data }) => {
      if (loading) {
        return <p>Loading...</p>;
      }
      if (error) {
        return <p>Error :(</p>;
      }
      return <User user={data.user} />;
    }}
  </Query>
);
export default UserContainer;