import React from 'react';

const User = (props) => {
    const { user } = props;
    return (
        <div>
            <p>id: {user.id}</p>
            <p>First Name: {user.first_name}</p>
            <p>Last Name: {user.last_name}</p>
            <p>Email: {user.email}</p>
        </div>
    )
}

export default User;