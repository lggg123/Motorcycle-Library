import React from 'react';
import { Query } from 'react-apollo';
import GET_MOTORCYCLE_QUERY from './get-motorcycle-query.graphql';
import Motorcycle from './Motorcycle';
const MotorcycleContainer = () => (
  <Query query={GET_MOTORCYCLE_QUERY}>
    {({ loading, error, data }) => {
      if (loading) {
        return <p>Loading...</p>;
      }
      if (error) {
        return <p>Error :(</p>;
      }
      return <Motorcycle motorcyle={data.motorcycle} />;
    }}
  </Query>
);
export default MotorcycleContainer;