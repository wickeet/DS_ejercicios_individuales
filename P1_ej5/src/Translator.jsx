import React, { useState } from 'react';
import NumberArea from './NumberArea';
import { SistemaImperial, AdaptadorDistancia } from './adaptador';
import './Translator.css';

const Translator = () => {
    const [inputText, setInputText] = useState('');
    const [outputText, setOutputText] = useState('');

    const handleTranslate = () => {
        const sistemaImperial = new SistemaImperial(inputText);
        const adaptador = new AdaptadorDistancia(sistemaImperial);
        const translatedText = adaptador.getDistance();
        setOutputText(translatedText);
    };

    return (
        <div className="translator">
            <NumberArea value={inputText} onChange={(e) => setInputText(e.target.value)} placeholder="Introduce un valor" readOnly={false} />
            <button onClick={handleTranslate}>Convertir</button>
            <NumberArea value={outputText} onChange={(e) => setOutputText(e.target.value)} placeholder="Valor convertido" readOnly={true}/>
        </div>
    );
};

export default Translator;
