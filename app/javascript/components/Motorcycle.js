import React from 'react';

const Motorcycle = (props) => {
    const { motorcycle } = props;
    return (
        <div>
            <p>id: {motorcycle.id}</p>
            <p>title: {motorcycle.title}</p>
            <p>description: {motorcycle.description}</p>
            <p>image_url: {motorcycle.image_url}</p>
            <p>user_id: {motorcycle.user.id}</p>
        </div>
    )
}

export default Motorcycle;