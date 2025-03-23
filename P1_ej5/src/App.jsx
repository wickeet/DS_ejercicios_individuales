import './App.css';
import Translator from './Translator';

function App() {
  return (
    <div>
      <h1>Convertidor de Millas a Kilómetros</h1>
      <div className='row'>
        <div className='column'>
          <img src="/im2.png" className='laterales' />
        </div>
        <div className='column'>
          <Translator />
        </div>
        <div className='column'>
          <img src="/im1.png" className='laterales' />
        </div>
      </div>
      <img src="/im3.png" id='esqueleto' />
    </div>
  );
}

export default App;
