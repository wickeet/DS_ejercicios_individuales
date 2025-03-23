import React from 'react';
import './NumberArea.css';

const NumberArea = ({ value, onChange, placeholder, readOnly }) => {
    return (
        <input 
            type="number" 
            value={value} 
            onChange={onChange} 
            placeholder={placeholder} 
            readOnly={readOnly} 
        />
    );
};

export default NumberArea;