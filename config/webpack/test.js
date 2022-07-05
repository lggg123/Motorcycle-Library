import React from 'react';
import { shallow } from "enzyme";
import { App } from "./App";

describe('Test App Entry point', function () {
  it('should have a header tag with Hello world React!', function () {
    const wrapper = shallow(<App/>);
    expect(wrapper.find("h1").text()).toEqual("Hello world React!");
  });
});

// const Enzyme = require('enzyme');
// const Adapter = require('enzyme-adapter-react-16');

// Enzyme.configure({ adapter: new Adapter() });

// import { graphql } from 'graphql';
// import createLoaders from '../loaders';

// import schema from '../schema';

// type Options = {
//   context?: {
//     user?: ?Object,
//   },
//   variables?: ?Object,
// };

// // Nice little helper function for tests
// export const request = (query: mixed, { context, variables }: Options = {}) =>
//   graphql(
//     schema,
//     query,
//     undefined,
//     { loaders: createLoaders(), ...context },
//     variables
// );

// import { configure } from 'enzyme';
// import Adapter from 'enzyme-adapter-react-16';
// import React from 'react';
// import { mount, shallow } from 'enzyme';
// import wait from 'waait';
// import { MockedProvider } from '@apollo/client/testing';
// // Make sure the MockComponent is imported before the CatContainer
// import MockComponent from '../../jest/test-support/MockComponent';
// import GET_USER_QUERY from '../../app/javascript/components/get-user-query.graphql';
// import GET_MOTORCYCLE_QUERY from '../../app/javascript/components/get-motorcycle-query.graphql';
// import MotorcycleContainer from '../../app/javascript/components/MotorcycleContainer';
// import UserContainer from '../../app/javascript/components/UserContainer'

// var util= require('util');
// var encoder = new util.TextEncoder('utf-8');

// configure({ adapter: new Adapter() });

// process.env.NODE_ENV = process.env.NODE_ENV || 'development'

// const environment = require('./environment')

// module.exports = environment.toWebpackConfig()

// jest.mock('../../app/javascript/components/User', () => MockComponent);
// describe('Mocked User', () => {
//   let mocks;
//   beforeEach(() => {
//     mocks = [
//       {
//         request: { query: GET_USER_QUERY },
//         result: {
//           data: {
//             user: {
//               __typename: 'User',
//               id: '123',
//               first_name: 'Michael',
//               last_name: 'Johnson',
//               email: 'michaeljohnson@gmail.com'
//             },
//           },
//         },
//       },
//     ];
//   });
//   test('<UserContainer />', async () => {
//     const wrapper = shallow((
//       <MockedProvider mocks={mocks}>
//         <UserContainer />
//       </MockedProvider>
//     ));
//     await wait(0);
//     expect(wrapper.update().find(MockComponent).prop('user')).toMatchObject({ id: '123', first_name: 'Michael', last_name: 'Johnson', email: 'michaeljohnson@gmail.com' });
//   });
// });


// jest.mock('../../app/javascript/components/Motorcycle', () => MockComponent);
// describe('Mocked Motorcycle', () => {
// let mocks;
// beforeEach(() => {
//   mocks = [
//     {
//       request: { query: GET_MOTORCYCLE_QUERY },
//       result: {
//         data: {
//           motorcycle: {
//             __typename: 'Motorcycle',
//             id: '123',
//             title: 'Motorcycle 123',
//             description: 'A new motorcycle for the ages',
//             image_url: 'https://www.googleimages.com/534523asdfs',
//             user_id: 1
//           },
//         },
//       },
//     },
//   ];
// });
// test('<MotorcycleContainer />', async () => {
//   const wrapper = shallow((
//     <MockedProvider mocks={mocks}>
//       <MotorcycleContainer />
//     </MockedProvider>
//   ));
//   await wait(0);
//   expect(wrapper.update().find(MockComponent).prop('motorcycle')).toMatchObject({ id: '123', title: 'Motorcycle 123', description: 'A new motorcycle for the ages', image_url: 'https://www.googleimages.com/534523asdfs', user_id: 1 });
// });
// });

// beforeAll(async () => {
//   await prisma.deleteManyUsers()
// })
// describe('Tests the createUser Mutation', () => {
//     it('should not signup a user with a password less than 8 characters', async () => {
//           const createUser = gql`
//             mutation {
//               createUser(data: {
//                 name: "Gbolahan Olagunju",
//                 email: "gbols@example.com",
//                 password: "dafe",
//               }){
//                 token
//                 user {
//                   name
//                   password
//                   email
//                   id
//                 }
//               }
//             }
//             `;
    
//     await expect(client.mutate({
//       mutation: createUser
//     })).rejects.toThrowError("password must be more than 8 characters");
//   })
//   it('should successfully create a user with valid credentials', async () => {
//     const createUser = gql`
//             mutation {
//               createUser(data: {
//                 name: "Gbolahan Olagunju",
//                 email: "gbols@example.com",
//                 password: "dafeMania"
//               }){
//                 token
//                 user {
//                   id
//                 }
//               }
//             }
//             `;
          
//      const res = await client.mutate({
//       mutation: createUser
//     })
//     const exists = await prisma.$exists.user({id : res.data.createUser.id});
//     expect(exists).toBe(true);
//   });

//   it('should not create two users with the same crededntials', async () => {
//     const createUser = gql`
//             mutation {
//               createUser(data: {
//                 name: "Gbolahan Olagunju",
//                 email: "gbols@example.com",
//                 password: "dafeMania"
//               }){
//                 token
//                 user {
//                   name
//                   password
//                   email
//                   id
//                 }
//               }
//             }
//             `;
//     await expect(client.mutate({
//       mutation: createUser
//     })).rejects.toThrowError("A unique constraint would be violated on User. Details: Field name = email");
//   });
// });